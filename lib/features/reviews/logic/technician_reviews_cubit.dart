import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/reviews/domain/use_cases/get_technician_reviews_use_case.dart';
import 'package:salla7ly/features/reviews/logic/technician_reviews_state.dart';

@injectable
class TechnicianReviewsCubit extends Cubit<TechnicianReviewsState> {
  final GetTechnicianReviewsUseCase _getTechnicianReviews;
  TechnicianReviewsCubit(this._getTechnicianReviews)
    : super(TechnicianReviewsInitial());

  Future<void> getMyReviews({int page = 1, int limit = 20}) async {
    emit(TechnicianReviewsLoading());
    final result = await _getTechnicianReviews.execute(
      page: page,
      limit: limit,
    );
    result.when(
      success: (reviews) => emit(TechnicianReviewsSuccess(reviews)),
      failure: (error) => emit(
        TechnicianReviewsError(error.error?.message ?? 'تعذر تحميل التقييمات'),
      ),
    );
  }
}
