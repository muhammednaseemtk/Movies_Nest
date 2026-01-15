import 'package:flutter/material.dart';
import 'package:movie_nest/core/app_colors.dart';

class CustomProfileAvatar extends StatelessWidget {
  final String imagePath;
  final String name;

  const CustomProfileAvatar({
    super.key,
    required this.imagePath,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Container(
            padding: const EdgeInsets.all(3),
            decoration:  BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.txtClr2,
            ),
            child: CircleAvatar(
              radius: 32,
              backgroundImage: AssetImage(imagePath),
            ),
          ),
        ),
         SizedBox(height: 8),
        Text(
          name,
          style:  TextStyle(
            color: AppColors.txtClr,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
