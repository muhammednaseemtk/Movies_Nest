import 'package:flutter/material.dart';
import 'package:movie_nest/core/app_colors.dart';

class CustomRecentBar extends StatelessWidget {
  final VoidCallback? onClear;

  const CustomRecentBar({super.key, this.onClear});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'RECENT SEARCHES',
            style: TextStyle(
              color: AppColors.txtClr1,
              fontSize: 13,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
      
          GestureDetector(
            onTap: onClear,
            child:  Text(
              'CLEAR ALL',
              style: TextStyle(
                color: AppColors.txtClr2,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
