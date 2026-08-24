part of 'technician_jobs_cubit.dart';

abstract class TechnicianJobsState {}

class TechnicianJobsInitial extends TechnicianJobsState {}

class TechnicianJobsLoading extends TechnicianJobsState {}

class TechnicianJobsSuccess extends TechnicianJobsState {
  final List<TechnicianJob> jobs;
  TechnicianJobsSuccess(this.jobs);
}

class TechnicianJobsError extends TechnicianJobsState {
  final String message;
  TechnicianJobsError(this.message);
}

class TechnicianJobsLoadingMore extends TechnicianJobsState {
  final List<TechnicianJob> jobs;
  TechnicianJobsLoadingMore(this.jobs);
}

class TechnicianJobsLoadMoreError extends TechnicianJobsState {
  final String message;
  final List<TechnicianJob> jobs;
  TechnicianJobsLoadMoreError(this.message, this.jobs);
}
