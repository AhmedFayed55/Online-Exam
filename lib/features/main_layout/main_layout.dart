import 'package:flutter/material.dart';
import 'package:online_exam/features/main_layout/widgets/button_nav_bar.dart';
import 'package:online_exam/features/main_layout/explore/presentation/pages/explore_screen.dart';

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
        children: const [
          ExploreScreen(),
          Center(child: Text('result')),
          Center(child: Text('profile')),
        ],
      ),
    );
  }
}
