import 'package:flutter/material.dart';
import 'package:movie_nest/core/app_colors.dart';

class CustomMovieTitle extends StatelessWidget {
  final String? title;
  final String? rating;
  final String? year;
  final String? duration;
  final String? quality;

  const CustomMovieTitle({
    super.key,
    this.title,
    this.rating,
    this.year,
    this.duration,
    this.quality,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 TITLE (API ready)
          Text(
            title ?? '',
            style: TextStyle(
              color: AppColors.txtClr,
              fontSize: 32,
              fontWeight: FontWeight.bold,
              height: 1.1,
            ),
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Icon(Icons.star, color: AppColors.txtClr5, size: 16),
              const SizedBox(width: 4),

              // 🔹 RATING
              Text(
                rating ?? '',
                style: TextStyle(color: AppColors.txtClr),
              ),

              const SizedBox(width: 8),

              // 🔹 YEAR
              Text(
                year ?? '',
                style: TextStyle(color: AppColors.txtClr3),
              ),

              const SizedBox(width: 8),

              // 🔹 DURATION
              Text(
                duration ?? '',
                style: TextStyle(color: AppColors.txtClr3),
              ),

              const SizedBox(width: 8),

              // 🔹 QUALITY
              Container(
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.txtClr4,
                ),
                child: Center(
                  child: Text(
                    quality ?? '',
                    style: TextStyle(color: AppColors.txtClr3),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
