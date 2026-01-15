import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:movie_nest/core/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.backgroundColor,
      currentIndex: currentIndex,
      selectedItemColor: AppColors.btnClr,
      showUnselectedLabels: true,
      unselectedItemColor: AppColors.txtClr4,
      onTap: onTap,
      items:  [
        BottomNavigationBarItem(icon: Icon(EneftyIcons.home_2_outline), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(EneftyIcons.search_normal_2_outline),
          label: 'Search',
        ),
        BottomNavigationBarItem(icon: Icon(EneftyIcons.save_2_outline),label: 'My List')
      ],
    );
  }
}
