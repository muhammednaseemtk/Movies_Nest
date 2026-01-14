  import 'package:flutter/material.dart';
import 'package:movie_nest/core/app_colors.dart';

  class BottomNavBar extends StatelessWidget {
    final int currentIndex;
    final ValueChanged<int> onTap;
    const BottomNavBar({super.key,required this.currentIndex,required this.onTap});

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
        items: const[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'HOME'
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_outlined),
            label: 'PROFILE'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: 'SEARCH'
          ),
        ]
        );
    }
  }