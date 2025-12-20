import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:cure/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:cure/core/utils/app_colors.dart';

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
    Center(child: Text('Wishlist')),
    Center(child: Text('Compare')),
    Center(child: Text('Profile')),
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
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.flip,
        backgroundColor: Colors.white,
        activeColor: AppColors.primary,
        color: AppColors.grey,
        items: const [
          TabItem(icon: Icons.home_outlined, title: 'Home'),
          TabItem(icon: Icons.favorite_border, title: 'Favorite'),
          TabItem(icon: Icons.compare_arrows_outlined, title: 'Compare'),
          TabItem(icon: Icons.person_outline, title: 'Profile'),
        ],
        initialActiveIndex: _currentIndex,
        onTap: changeTab,
      ),
    );
  }
}
