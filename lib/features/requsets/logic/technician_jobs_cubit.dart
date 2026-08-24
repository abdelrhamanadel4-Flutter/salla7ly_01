import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:salla7ly/core/networking/api_result.dart';
import 'package:salla7ly/core/networking/socket_service.dart';
import 'package:salla7ly/features/requsets/domain/entity/technician_job.dart';
import 'package:salla7ly/features/requsets/domain/use_cases/get_technician_jobs_use_case.dart';

part 'technician_jobs_state.dart';

@injectable
class TechnicianJobsCubit extends Cubit<TechnicianJobsState> {
  final GetTechnicianJobsUseCase _getJobsUseCase;
  final SocketService _socketService;

  StreamSubscription? _jobNewSub;
  StreamSubscription? _jobClosedSub;

  TechnicianJobsCubit(this._getJobsUseCase, this._socketService)
    : super(TechnicianJobsInitial());

  List<TechnicianJob> jobs = [];
  int currentPage = 1;
  bool isLastPage = false;
  String _status = 'PENDING';
  static const int limit = 20;

  Future<void> fetchJobs({
    bool isLoadMore = false,
    String status = 'PENDING',
  }) async {
    if (isLoadMore) {
      if (isLastPage) return;
      currentPage++;
      emit(TechnicianJobsLoadingMore(jobs));
    } else {
      _status = status;
      currentPage = 1;
      jobs.clear();
      isLastPage = false;
      emit(TechnicianJobsLoading());
    }

    await _socketService.connect();
    _listenToSocket();

    final result = await _getJobsUseCase.execute(
      page: currentPage,
      limit: limit,
      status: _status,
    );

    result.when(
      success: (newJobs) {
        if (newJobs.isEmpty || newJobs.length < limit) {
          isLastPage = true;
        }
        jobs.addAll(newJobs);
        emit(TechnicianJobsSuccess(List.from(jobs)));
      },
      failure: (error) {
        if (isLoadMore) {
          currentPage--;
          emit(TechnicianJobsLoadMoreError(error.error?.message ?? '', jobs));
        } else {
          emit(TechnicianJobsError(error.error?.message ?? ''));
        }
      },
    );
  }

  void _listenToSocket() {
    if (_status == 'PENDING') {
      _jobNewSub ??= _socketService.jobNew.listen((event) {
        if (_status != 'PENDING') return;
        jobs.insert(0, event.job);
        emit(TechnicianJobsSuccess(List.from(jobs)));
      });
    }

    _jobClosedSub ??= _socketService.jobClosed.listen((event) {
      jobs.removeWhere((job) => job.request?.id == event.requestId);
      emit(TechnicianJobsSuccess(List.from(jobs)));
    });
  }

  @override
  Future<void> close() {
    _jobNewSub?.cancel();
    _jobClosedSub?.cancel();
    return super.close();
  }
}
