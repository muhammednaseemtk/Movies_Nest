import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:movie_nest/core/constants/app_colors.dart';

class CustomTopMovie extends StatelessWidget {

  const CustomTopMovie({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Iconsax.video_horizontal_copy,
                color: AppColors.txtClr2,
                size: 28,
              ),
               SizedBox(width: 6),
              Text(
                'MOVIES NEST',
                style: TextStyle(
                  color: AppColors.txtClr,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
