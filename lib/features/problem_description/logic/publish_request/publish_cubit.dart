import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/features/problem_description/domain/entity/publish_request_response.dart';
import 'package:salla7ly/features/problem_description/domain/use_cases/publish_use_case.dart';
import 'package:salla7ly/features/problem_description/logic/publish_request/publish_state.dart';


@injectable
class PublishCubit extends Cubit<PublishState<PublishRequestResponse>> {
  final PublishUseCase _publishUseCase;

  PublishCubit(this._publishUseCase)
      : super(const PublishState.initial());

  Future<void> publishRequest(String id) async {
    if (state is Loading) return;

    emit(const PublishState.loading());

    final result = await _publishUseCase.invoke(id);

    result.when(
      success: (data) {
        emit(PublishState.success(data));
      },
      failure: (error) {
        emit(PublishState.error(error));
      },
    );
  }
}