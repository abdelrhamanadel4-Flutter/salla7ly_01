part of 'submit_job_offer_cubit.dart';

abstract class SubmitJobOfferState {}

class SubmitJobOfferInitial extends SubmitJobOfferState {}

class SubmitJobOfferLoading extends SubmitJobOfferState {}

class SubmitJobOfferSuccess extends SubmitJobOfferState {
  final SubmittedJobOffer offer;
  SubmitJobOfferSuccess(this.offer);
}

class SubmitJobOfferError extends SubmitJobOfferState {
  final String message;
  SubmitJobOfferError(this.message);
}
