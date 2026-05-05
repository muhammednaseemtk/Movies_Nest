import 'package:flutter/material.dart';
import 'package:movie_nest/core/constants/app_colors.dart';

class MovieTitle extends StatelessWidget {
  final String? title;
  final String? rating;
  final String? year;
  final String? date;
  final String? quality;

  const MovieTitle({
    super.key,
    this.title,
    this.rating,
    this.year,
    this.date,
    this.quality,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? '',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
              height: 1.1,
            ),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.star, color: AppColors.txtClr, size: 16),
              SizedBox(width: 4),
              Text(rating ?? '', style: TextStyle(color: AppColors.white)),
              SizedBox(width: 8),
              Text(year ?? '', style: TextStyle(color: AppColors.white70)),
              SizedBox(width: 8),
              Text(date ?? '', style: TextStyle(color: AppColors.white70)),
              SizedBox(width: 8),
              Container(
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.white24,
                ),
                child: Center(
                  child: Text(
                    quality ?? '',
                    style: TextStyle(color: AppColors.white70),
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
