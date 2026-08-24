import 'package:salla7ly/features/reviews/domain/entities/technician_reviews_page.dart';

abstract class TechnicianReviewsState {}

class TechnicianReviewsInitial extends TechnicianReviewsState {}

class TechnicianReviewsLoading extends TechnicianReviewsState {}

class TechnicianReviewsSuccess extends TechnicianReviewsState {
  final TechnicianReviewsPage page;
  TechnicianReviewsSuccess(this.page);
}

class TechnicianReviewsError extends TechnicianReviewsState {
  final String message;
  TechnicianReviewsError(this.message);
}
