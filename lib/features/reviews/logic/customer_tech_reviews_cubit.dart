import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/reviews/domain/entities/customer_tech_review.dart';
import 'package:salla7ly/features/reviews/domain/use_cases/get_customer_tech_reviews_use_case.dart';

abstract class CustomerTechReviewsState {}

class CustomerTechReviewsInitial extends CustomerTechReviewsState {}

class CustomerTechReviewsLoading extends CustomerTechReviewsState {}

class CustomerTechReviewsSuccess extends CustomerTechReviewsState {
  final CustomerTechReviewsData data;

  CustomerTechReviewsSuccess(this.data);
}

class CustomerTechReviewsError extends CustomerTechReviewsState {
  final String message;

  CustomerTechReviewsError(this.message);
}

@injectable
class CustomerTechReviewsCubit extends Cubit<CustomerTechReviewsState> {
  final GetCustomerTechReviewsUseCase _getCustomerTechReviewsUseCase;

  CustomerTechReviewsCubit(this._getCustomerTechReviewsUseCase)
      : super(CustomerTechReviewsInitial());

  Future<void> getReviews(String technicianId) async {
    emit(CustomerTechReviewsLoading());

    final result = await _getCustomerTechReviewsUseCase.execute(technicianId);

    result.when(
      success: (data) => emit(CustomerTechReviewsSuccess(data)),
      failure: (error) => emit(
        CustomerTechReviewsError(error.error?.message ?? 'تعذر تحميل التقييمات'),
      ),
    );
  }
}
