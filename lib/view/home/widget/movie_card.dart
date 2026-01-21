import 'package:flutter/material.dart';
import 'package:movie_nest/controller/upcoming_movie_controller.dart';
import 'package:movie_nest/core/app_colors.dart';
import 'package:provider/provider.dart';

class CustomMovieCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String rating;
  final String year;
  final String country;
  final VoidCallback? onPlayTap;

  const CustomMovieCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.rating,
    required this.year,
    required this.country,
    this.onPlayTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.txtClr4,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Consumer<MovieController>(
        builder: (context, value, child) {
          return Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  imagePath,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.txtClr,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.star, color: AppColors.txtClr5, size: 14),
                        SizedBox(width: 4),
                        Text(
                          rating.toString(),
                          style: TextStyle(
                            color: AppColors.txtClr3,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(width: 6),
                        Text(
                          '• $year',
                          style: TextStyle(
                            color: AppColors.txtClr3,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.backgroundColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        country.toUpperCase(),
                        style: TextStyle(
                          color: AppColors.txtClr2,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.btnClr,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: onPlayTap,
                  icon: Icon(Icons.play_arrow, color: AppColors.txtClr),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
