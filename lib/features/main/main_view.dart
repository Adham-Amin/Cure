import 'package:cure/core/services/shared_preferences_service.dart';
import 'package:cure/core/utils/app_styles.dart';
import 'package:cure/features/home/presentation/views/home_view.dart';
import 'package:cure/features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:cure/core/utils/app_colors.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static final GlobalKey<MainViewState> mainViewKey =
      GlobalKey<MainViewState>();

  @override
  State<MainView> createState() => MainViewState();
}

class MainViewState extends State<MainView> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeView(),
    SearchView(),
    Center(child: Text('Booking')),
    Center(
      child: IconButton(
        onPressed: () {
          Prefs.clearUserData();
        },
        icon: const Icon(Icons.logout),
      ),
    ),
  ];

  void changeTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withValues(alpha: .2),
            ),
          ],
        ),
        child: GNav(
          curve: Curves.easeOutExpo,
          rippleColor: AppColors.grey,
          hoverColor: AppColors.grey,
          haptic: true,
          tabBorderRadius: 20,
          gap: 5,
          activeColor: AppColors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          duration: const Duration(milliseconds: 400),
          tabBackgroundColor: AppColors.primary,
          textStyle: AppStyles.textMedium18.copyWith(color: AppColors.white),
          tabs: const [
            GButton(icon: Icons.home, text: 'Home'),
            GButton(icon: Icons.search, text: 'Search'),
            GButton(icon: Icons.calendar_month_rounded, text: 'Booking'),
            GButton(icon: Icons.person, text: 'Profile'),
          ],
          selectedIndex: _currentIndex,
          onTabChange: changeTab,
        ),
      ),
    );
  }
}
