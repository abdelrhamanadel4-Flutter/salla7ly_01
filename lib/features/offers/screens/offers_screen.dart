import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';
import 'package:salla7ly/features/offers/widgets/offer_card.dart';
import 'package:salla7ly/features/offers/widgets/offers_header.dart';
import 'package:salla7ly/features/requsets/domain/entity/technician_job.dart';
import 'package:salla7ly/features/requsets/logic/technician_jobs_cubit.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => context.read<TechnicianJobsCubit>().fetchJobs(
            status: 'SUBMITTED',
          ),
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const OffersHeader(),
                      SizedBox(height: 20.h),
                      Text('عروض', style: AppStyles.semiBold24Primary),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ),
              BlocBuilder<TechnicianJobsCubit, TechnicianJobsState>(
                builder: (context, state) {
                  if (state is TechnicianJobsLoading) {
                    return const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                  if (state is TechnicianJobsError) {
                    return SliverFillRemaining(
                      child: Center(child: Text(state.message)),
                    );
                  }

                  final jobs = _getJobs(state);
                  if (jobs.isEmpty) {
                    return SliverFillRemaining(
                      child: Center(
                        child: Text(
                          'لا توجد عروض حالياً',
                          style: AppStyles.mediun12Primary,
                        ),
                      ),
                    );
                  }

                  return SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final job = jobs[index];
                        return OfferCard(
                          technicianName: job.request?.customer?.fullName ?? '',
                          serviceName:
                              'المسافة: ${job.request?.customer?.distanceKm ?? '—'} كم',
                          date: job.status ?? '',
                        );
                      }, childCount: jobs.length),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<TechnicianJob> _getJobs(TechnicianJobsState state) {
    if (state is TechnicianJobsSuccess) return state.jobs;
    if (state is TechnicianJobsLoadingMore) return state.jobs;
    if (state is TechnicianJobsLoadMoreError) return state.jobs;
    return [];
  }
}
