import 'package:flutter/material.dart';
import 'package:movie_nest/core/app_colors.dart';

class CustomMovieTitle extends StatelessWidget {
  const CustomMovieTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            'IT',
            style: TextStyle(
              color: AppColors.txtClr,
              fontSize: 32,
              fontWeight: FontWeight.bold,
              height: 1.1,
            ),
          ),
           SizedBox(height: 12),
          Row(
            children: [
               Icon(Icons.star, color: AppColors.txtClr5, size: 16),
               SizedBox(width: 4),
               Text('8.9', style: TextStyle(color: AppColors.txtClr)),
               SizedBox(width: 8),
               Text('2024', style: TextStyle(color: AppColors.txtClr3)),
               SizedBox(width: 8),
               Text('2h 34m', style: TextStyle(color: AppColors.txtClr3)),
               SizedBox(width: 8),
               Container(
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.txtClr4
                ),
                child: Center(child: Text('4k HDR',style: TextStyle(color: AppColors.txtClr3),)),
               )
            ],
          ),
        ],
      ),
    );
  }
}
