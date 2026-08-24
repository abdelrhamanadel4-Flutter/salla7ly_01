import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/problem_description/domain/entity/problem_description_response.dart';
import 'package:salla7ly/features/problem_description/domain/use_cases/cancel_request_use_case.dart';
import 'package:salla7ly/features/problem_description/logic/publish_request/publish_state.dart';

@injectable
class CancelRequestCubit extends Cubit<PublishState<ProblemDescriptionResponse>> {
  final CancelRequestUseCase _cancelRequestUseCase;

  CancelRequestCubit(this._cancelRequestUseCase)
      : super(const PublishState.initial());

  Future<void> cancelRequest(String requestId) async {
    if (state is Loading) return;

    emit(const PublishState.loading());
    final result = await _cancelRequestUseCase.invoke(requestId);

    result.when(
      success: (data) => emit(PublishState.success(data)),
      failure: (error) => emit(PublishState.error(error)),
    );
  }
}
