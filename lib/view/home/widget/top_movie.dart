import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:movie_nest/core/app_colors.dart';

class CustomTopMovie extends StatelessWidget {
  final VoidCallback? onSearchTap;

  const CustomTopMovie({
    super.key,
    this.onSearchTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                EneftyIcons.play_bold,
                color: AppColors.txtClr2,
                size: 28,
              ),
               SizedBox(width: 6),
              Text(
                'MOVIES NEST',
                style: TextStyle(
                  color: AppColors.txtClr,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: onSearchTap,
            icon: Icon(EneftyIcons.search_normal_outline, color: AppColors.txtClr),
          ),
        ],
      ),
    );
  }
}
