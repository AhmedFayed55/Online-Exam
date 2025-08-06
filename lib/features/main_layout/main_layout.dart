import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/di/di.dart';
import 'package:online_exam/features/main_layout/explore/presentation/manger/cubit/explore_cubit.dart';
import 'package:online_exam/features/main_layout/explore/presentation/pages/explore_screen.dart';
import 'package:online_exam/features/main_layout/profile/presentation/pages/profile_screen.dart';
import 'package:online_exam/features/main_layout/widgets/button_nav_bar.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomButtonNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: IndexedStack(
        index: currentIndex,
        children: [
          BlocProvider(
            create: (context) => getIt.get<ExploreCubit>()..getSubjects(),
            child: const ExploreScreen(),
          ),
          const Center(child: Text('result')),
          const Center(child: ProfileScreen()),
        ],
      ),
    );
  }
}
