import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/reviews/domain/entities/technician_review.dart';
import 'package:salla7ly/features/reviews/domain/use_cases/get_technician_reviews_use_case.dart';

abstract class TechnicianReviewsState {}

class TechnicianReviewsInitial extends TechnicianReviewsState {}

class TechnicianReviewsLoading extends TechnicianReviewsState {}

class TechnicianReviewsSuccess extends TechnicianReviewsState {
  final TechnicianReviewsData data;

  TechnicianReviewsSuccess(this.data);
}

class TechnicianReviewsError extends TechnicianReviewsState {
  final String message;

  TechnicianReviewsError(this.message);
}

@injectable
class TechnicianReviewsCubit extends Cubit<TechnicianReviewsState> {
  final GetTechnicianReviewsUseCase _getTechnicianReviewsUseCase;

  TechnicianReviewsCubit(this._getTechnicianReviewsUseCase)
      : super(TechnicianReviewsInitial());

  Future<void> getReviews(String technicianId) async {
    emit(TechnicianReviewsLoading());

    final result = await _getTechnicianReviewsUseCase.execute(technicianId);

    result.when(
      success: (data) => emit(TechnicianReviewsSuccess(data)),
      failure: (error) => emit(
        TechnicianReviewsError(error.error?.message ?? 'تعذر تحميل التقييمات'),
      ),
    );
  }
}
