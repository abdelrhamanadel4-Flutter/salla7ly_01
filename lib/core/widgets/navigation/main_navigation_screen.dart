import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla7ly/core/di/injectoin.dart';
import 'package:salla7ly/features/categories/logic/categories/categories_cubit.dart';
import 'package:salla7ly/features/edit_profile/ui/screens/edit_profile_screan.dart';
import 'package:salla7ly/features/categories/ui/screens/categories_screen.dart';
import 'package:salla7ly/features/profile/logic/profile_cubit.dart';
import 'package:salla7ly/features/profile/ui/screens/profile_screen.dart';

import 'bottom_nav_bar.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int currentIndex = 0;

  late final List<Widget> screens;

  @override
  void initState() {
    super.initState();

    screens = [
      BlocProvider(
        create: (_) => getIt<ProfileCubit>()..getProfile(),
        child: const ProfileScreen(),
      ),
      BlocProvider(
        create: (context) => getIt<CategoriesCubit>()..getCategories(),
        child: const CategoriesScreen(),
      ),

      BlocProvider(
        create: (_) => getIt<ProfileCubit>()..getProfile(),
        child: const EditProfileScrean(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],

      bottomNavigationBar: BottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
