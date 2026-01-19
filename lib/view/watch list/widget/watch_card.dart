import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:movie_nest/core/app_colors.dart';

class CustomWatchCard extends StatelessWidget {
  final String image;
  final String title;
  final String rating;
  final String year;
  final VoidCallback onRemove;


  const CustomWatchCard({
    super.key,
    required this.image,
    required this.title,
    required this.rating,
    required this.year,
    required this.onRemove
  });

  String fixedImageUrl(String url) {
    return url.replaceAll(' ', '');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        height: 120,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.txtfld,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                fixedImageUrl(image),
                width: 80,
                height: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 80,
                    color: AppColors.black,
                    child: Icon(Icons.broken_image),
                  );
                },
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
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.txtClr,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    year,
                    style: TextStyle(color: AppColors.txtClr1, fontSize: 13),
                  ),
                ],
              ),
            ),

            IconButton(
              onPressed: onRemove,
              icon: Icon(
                EneftyIcons.close_square_outline,
                color: AppColors.txtClr1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
