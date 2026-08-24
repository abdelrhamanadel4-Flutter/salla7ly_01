import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla7ly/core/di/injectoin.dart';
import 'package:salla7ly/features/categories/logic/categories/categories_cubit.dart';
import 'package:salla7ly/features/categories/ui/screens/categories_screen.dart';
import 'package:salla7ly/features/orders/screens/orders_screen.dart';
import 'package:salla7ly/features/profile/logic/profile_cubit.dart';
import 'package:salla7ly/features/profile/ui/screens/profile_screen.dart';

import 'bottom_nav_bar.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key, this.initialIndex = 0});

  final int initialIndex;

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  late int currentIndex;

  late final List<Widget> screens;

  @override
  void initState() {
    super.initState();

    currentIndex = widget.initialIndex;

    screens = [
      BlocProvider(
        create: (_) => getIt<ProfileCubit>()..getProfile(),
        child: const ProfileScreen(),
      ),
      BlocProvider(
        create: (context) => getIt<CategoriesCubit>()..getCategories(),
        child: const CategoriesScreen(showBackButton: false),
      ),
      OrdersScreen(),
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
