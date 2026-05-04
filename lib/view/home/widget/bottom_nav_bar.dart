import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:movie_nest/core/constants/app_colors.dart';

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
        BottomNavigationBarItem(icon: Icon(Iconsax.house_copy), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Iconsax.search_normal_copy),
          label: 'Search',
        ),
        BottomNavigationBarItem(icon: Icon(Iconsax.save_2_copy),label: 'Saved')
      ],
    );
  }
}
