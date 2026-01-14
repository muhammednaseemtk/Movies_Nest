import 'package:flutter/material.dart';
import 'package:movie_nest/core/app_colors.dart';

class CustomMovieButtons extends StatelessWidget {
  const CustomMovieButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon:  Icon(Icons.play_arrow, color: AppColors.txtClr, size: 28),
              label:  Text(
                "PLAY TRAILER",
                style: TextStyle(
                  color: AppColors.txtClr,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 0.5,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.btnClr,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
              ),
            ),
          ),
           SizedBox(height: 12), 
          SizedBox(
            width: double.infinity,
            height: 55,
            child: OutlinedButton.icon(
              onPressed: () {},
              icon:  Icon(Icons.bookmark_add, color: AppColors.txtClr, size: 24),
              label:  Text(
                "ADD TO WATCHLIST",
                style: TextStyle(
                  color: AppColors.txtClr,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 0.5,
                ),
              ),
              style: OutlinedButton.styleFrom(
                backgroundColor: AppColors.txtClr4, 
                side: const BorderSide(color: AppColors.txtClr),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}