import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/requsets/domain/entity/submitted_job_offer.dart';
import 'package:salla7ly/features/requsets/domain/use_cases/submit_job_offer_use_case.dart';

part 'submit_job_offer_state.dart';

@injectable
class SubmitJobOfferCubit extends Cubit<SubmitJobOfferState> {
  final SubmitJobOfferUseCase _submitUseCase;

  SubmitJobOfferCubit(this._submitUseCase) : super(SubmitJobOfferInitial());

  Future<void> submitOffer(String offerId, num consultationFee) async {
    emit(SubmitJobOfferLoading());

    final result = await _submitUseCase.execute(offerId, consultationFee);

    result.when(
      success: (offer) {
        emit(SubmitJobOfferSuccess(offer));
      },
      failure: (error) {
        emit(SubmitJobOfferError(error.error?.message ?? 'حدث خطأ'));
      },
    );
  }
}
