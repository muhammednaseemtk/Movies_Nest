import 'package:flutter/material.dart';
import 'package:movie_nest/core/app_colors.dart';

class CustomFilterCard extends StatelessWidget {
  final String title;

  const CustomFilterCard({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.txtfld,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.txtClr,
        ),
      ),
    );
  }
}
