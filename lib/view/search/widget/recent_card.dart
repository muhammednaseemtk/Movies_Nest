import 'package:flutter/material.dart';
import 'package:movie_nest/core/app_colors.dart';

class CustomRecentCard extends StatelessWidget {
  final String title;
  final VoidCallback onRemove;

  const CustomRecentCard({
    super.key,
    required this.title,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
               Icon(Icons.history, color: AppColors.txtClr, size: 18),
               SizedBox(width: 10),
              Text(
                title,
                style:  TextStyle(color: AppColors.txtClr),
              ),
            ],
          ),
          GestureDetector(
            onTap: onRemove,
            child:  Icon(Icons.close, color: AppColors.txtClr, size: 18),
          ),
        ],
      ),
    );
  }
}
