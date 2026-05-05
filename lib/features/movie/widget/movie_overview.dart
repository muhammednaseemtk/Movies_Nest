import 'package:flutter/material.dart';
import 'package:movie_nest/core/constants/app_colors.dart';

class MovieOverview extends StatelessWidget {
  final String? description;

  const MovieOverview({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final String overviewText =
        (description != null && description!.trim().isNotEmpty)
            ? description!
            : 'No overview available';

    return Column(
      children: [
        Text(
          'OVER VIEW',
          style: TextStyle(
            color: AppColors.white54,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.5,
            fontSize: 14,
          ),
        ),
         SizedBox(height: 8),
        Text(
          overviewText,
          style: TextStyle(
            color: AppColors.white54,
            fontSize: 15,
            height: 1.5,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
