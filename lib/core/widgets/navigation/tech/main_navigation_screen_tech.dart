import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla7ly/core/di/injectoin.dart';
import 'package:salla7ly/features/commissions/screens/commissions_screen.dart';
import 'package:salla7ly/features/home/home_screen.dart';
import 'package:salla7ly/features/offers/screens/offers_screen.dart';
import 'package:salla7ly/features/profile/logic/profile_cubit.dart';
import 'package:salla7ly/features/requsets/logic/technician_jobs_cubit.dart';

import 'bottom_nav_bar_tech.dart';

class MainNavigationScreenTech extends StatefulWidget {
  const MainNavigationScreenTech({super.key});

  @override
  State<MainNavigationScreenTech> createState() =>
      _MainNavigationScreenTechState();
}

class _MainNavigationScreenTechState extends State<MainNavigationScreenTech> {
  int currentIndex = 0;

  late final List<Widget> screens;
  late final TechnicianJobsCubit _submittedJobsCubit;

  @override
  void initState() {
    super.initState();

    _submittedJobsCubit = getIt<TechnicianJobsCubit>()
      ..fetchJobs(status: 'SUBMITTED');

    screens = [
      BlocProvider(
        create: (context) => getIt<ProfileCubit>()..getProfile(),
        child: HomeScreen(
          onCommissionsTap: () {
            setState(() {
              currentIndex = 1;
            });
          },
        ),
      ),
      CommissionsScreen(),
      BlocProvider.value(
        value: _submittedJobsCubit,
        child: const OffersScreen(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],

      bottomNavigationBar: BottomNavBarTech(
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == 2 && currentIndex != 2) {
            _submittedJobsCubit.fetchJobs(status: 'SUBMITTED');
          }
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    _submittedJobsCubit.close();
    super.dispose();
  }
}
