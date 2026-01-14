import 'package:flutter/material.dart';
import 'package:movie_nest/core/app_colors.dart';

class CustomBanner extends StatelessWidget {
  final String imagePath;
  final String category;
  final String title;
  final VoidCallback? onPlayTap;
  final VoidCallback? onAddTap;

  const CustomBanner({
    super.key,
    required this.imagePath,
    required this.category,
    required this.title,
    this.onPlayTap,
    this.onAddTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              AppColors.black,
              AppColors.transparent
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.btnClr,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                'ORIGINAL',
                style: TextStyle(
                  color: AppColors.txtClr,
                  fontSize: 10,
                ),
              ),
            ),
             SizedBox(height: 6),
            Text(
              category,
              style: TextStyle(color: AppColors.txtClr3),
            ),
             SizedBox(height: 6),
            Text(
              title,
              style: TextStyle(
                color: AppColors.txtClr,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
             SizedBox(height: 12),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: onPlayTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.btnClr,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: Icon(Icons.play_arrow,
                      color: AppColors.txtClr),
                  label: Text(
                    'Play',
                    style: TextStyle(color: AppColors.txtClr),
                  ),
                ),
                 SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.txtClr4,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    onPressed: onAddTap,
                    icon: Icon(Icons.add,
                        color: AppColors.txtClr),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
