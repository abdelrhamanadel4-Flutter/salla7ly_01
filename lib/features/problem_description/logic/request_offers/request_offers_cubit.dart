import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/core/networking/socket_service.dart';
import 'package:salla7ly/features/problem_description/domain/entity/customer_offer.dart';
import 'package:salla7ly/features/problem_description/domain/use_cases/get_offers_use_case.dart';
import 'package:salla7ly/features/problem_description/logic/publish_request/publish_state.dart';

@injectable
class RequestOffersCubit extends Cubit<PublishState<List<CustomerOffer>>> {
  final GetOffersUseCase _getOffersUseCase;
  final SocketService _socketService;

  StreamSubscription? _offerNewSubscription;
  StreamSubscription? _reconnectedSubscription;

  String? _currentRequestId;

  RequestOffersCubit(this._getOffersUseCase, this._socketService)
    : super(const PublishState.initial());

  Future<void> loadOffers(String requestId) async {
    _currentRequestId = requestId;

    _listenForLiveOffers(requestId);

    // Make sure socket is connected.
    await _socketService.connect();

    // REST fetch when screen opens.
    await _fetchOffers(requestId, showLoading: true);
  }

  Future<void> refreshOffers() async {
    final requestId = _currentRequestId;

    if (requestId == null || requestId.isEmpty) {
      return;
    }

    // Pull-to-refresh should not destroy the current cards.
    await _fetchOffers(requestId, showLoading: false);
  }

  Future<void> _fetchOffers(
    String requestId, {
    required bool showLoading,
  }) async {
    if (showLoading) {
      emit(const PublishState.loading());
    }

    final result = await _getOffersUseCase.invoke(requestId);

    result.when(
      success: (offers) {
        emit(PublishState.success(_sorted(offers)));
      },
      failure: (error) {
        emit(PublishState.error(error));
      },
    );
  }

  void _listenForLiveOffers(String requestId) {
    _offerNewSubscription?.cancel();
    _reconnectedSubscription?.cancel();

    // Live offers.
    _offerNewSubscription = _socketService.offerNew.listen((event) {
      if (event.requestId != requestId) {
        return;
      }

      final newOffer = event.offer;

      if (newOffer == null) {
        return;
      }

      final current = state.mapOrNull(success: (value) => value.data) ?? [];

      final withoutDuplicate = current
          .where((offer) => offer.offerId != newOffer.offerId)
          .toList();

      emit(PublishState.success(_sorted([...withoutDuplicate, newOffer])));
    });

    // REST fetch again after Socket.IO reconnect.
    _reconnectedSubscription = _socketService.reconnected.listen((_) {
      if (_currentRequestId != requestId) {
        return;
      }

      print(
        'REQUEST OFFERS: socket reconnected, '
        'refetching offers...',
      );

      refreshOffers();
    });
  }

  List<CustomerOffer> _sorted(List<CustomerOffer> offers) {
    final sorted = [...offers];

    sorted.sort((a, b) {
      final distanceA = a.technician?.distanceKm ?? double.maxFinite;

      final distanceB = b.technician?.distanceKm ?? double.maxFinite;

      final distanceCompare = distanceA.compareTo(distanceB);

      if (distanceCompare != 0) {
        return distanceCompare;
      }

      final ratingA = a.technician?.overallRating ?? 0;

      final ratingB = b.technician?.overallRating ?? 0;

      return ratingB.compareTo(ratingA);
    });

    return sorted;
  }

  @override
  Future<void> close() {
    _offerNewSubscription?.cancel();
    _reconnectedSubscription?.cancel();

    return super.close();
  }
}
