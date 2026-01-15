import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:movie_nest/core/app_colors.dart';

class CustomWatchCard extends StatelessWidget {
  final String image;
  final String title;
  final String rating;
  final String year;
  final String genre;
  final String duration;

  const CustomWatchCard({
    super.key,
    required this.image,
    required this.title,
    required this.rating,
    required this.year,
    required this.genre,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 120,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image,
                width: 80,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Icon(Icons.star, color: AppColors.txtClr5, size: 16),
                      SizedBox(width: 4),
                      Text(
                        rating,
                        style: TextStyle(
                          color: AppColors.txtClr,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Text(
                    title,
                    style: TextStyle(
                      color: AppColors.txtClr,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 6),
                  Text(
                    "$year • $genre • $duration",
                    style: TextStyle(color: AppColors.txtClr1, fontSize: 13),
                  ),
                ],
              ),
            ),
            Icon(EneftyIcons.close_square_outline, color: AppColors.txtClr1),
          ],
        ),
      ),
    );
  }
}
