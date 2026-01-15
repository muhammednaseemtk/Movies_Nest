import 'package:flutter/material.dart';
import 'package:movie_nest/core/app_colors.dart';

class CustomRecommendedMovie extends StatelessWidget {
  final String image;
  final String title;
  final String year;
  final String rating;

  const CustomRecommendedMovie({
    super.key,
    required this.image,
    required this.title,
    required this.year,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          height: 120,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                       Icon(
                        Icons.star,
                        color: AppColors.txtClr5,
                        size: 14,
                      ),
                       SizedBox(width: 4),
                      Text(
                        rating,
                        style:  TextStyle(
                          color: AppColors.txtClr,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style:  TextStyle(
            color: AppColors.txtClr,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),

        Text(
          year,
          style:  TextStyle(
            color: AppColors.txtClr1,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
