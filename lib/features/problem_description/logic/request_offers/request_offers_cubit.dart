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

  RequestOffersCubit(this._getOffersUseCase, this._socketService)
      : super(const PublishState.initial());

  Future<void> loadOffers(String requestId) async {
    emit(const PublishState.loading());

    final result = await _getOffersUseCase.invoke(requestId);

    result.when(
      success: (offers) => emit(PublishState.success(_sorted(offers))),
      failure: (error) => emit(PublishState.error(error)),
    );

    _listenForLiveOffers(requestId);
  }

  void _listenForLiveOffers(String requestId) {
    _offerNewSubscription?.cancel();
    _offerNewSubscription = _socketService.offerNew.listen((event) {
      if (event.requestId != requestId || event.offer == null) return;

      final current = state.mapOrNull(success: (value) => value.data) ?? [];
      final withoutDuplicate = current
          .where((offer) => offer.offerId != event.offer!.offerId)
          .toList();

      emit(PublishState.success(_sorted([...withoutDuplicate, event.offer!])));
    });
  }

  List<CustomerOffer> _sorted(List<CustomerOffer> offers) {
    final sorted = [...offers];
    sorted.sort((a, b) {
      final distanceCompare = (a.technician?.distanceKm ?? double.maxFinite)
          .compareTo(b.technician?.distanceKm ?? double.maxFinite);
      if (distanceCompare != 0) return distanceCompare;

      return (b.technician?.overallRating ?? 0)
          .compareTo(a.technician?.overallRating ?? 0);
    });
    return sorted;
  }

  @override
  Future<void> close() {
    _offerNewSubscription?.cancel();
    return super.close();
  }
}
