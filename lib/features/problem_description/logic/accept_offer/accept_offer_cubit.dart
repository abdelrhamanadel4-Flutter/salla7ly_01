import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/problem_description/domain/entity/accept_offer_response.dart';
import 'package:salla7ly/features/problem_description/domain/use_cases/accept_offer_use_case.dart';
import 'package:salla7ly/features/problem_description/logic/publish_request/publish_state.dart';

@injectable
class AcceptOfferCubit extends Cubit<PublishState<AcceptOfferResponse>> {
  final AcceptOfferUseCase _acceptOfferUseCase;

  AcceptOfferCubit(this._acceptOfferUseCase)
      : super(const PublishState.initial());

  Future<void> acceptOffer(String requestId, String offerId) async {
    if (state is Loading) return;

    emit(const PublishState.loading());

    final result = await _acceptOfferUseCase.invoke(requestId, offerId);

    result.when(
      success: (data) => emit(PublishState.success(data)),
      failure: (error) => emit(PublishState.error(error)),
    );
  }
}
