import 'package:flutter/material.dart';
import 'package:movie_nest/core/app_colors.dart';

class CustomSeeAll extends StatelessWidget {
  final String title;
  final VoidCallback? onSeeAllTap;

  const CustomSeeAll({
    super.key,
    required this.title,
    this.onSeeAllTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style:  TextStyle(
              color: AppColors.txtClr,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: onSeeAllTap,
            child:  Text(
              'See all',
              style: TextStyle(color: AppColors.txtClr2),
            ),
          ),
        ],
      ),
    );
  }
}
