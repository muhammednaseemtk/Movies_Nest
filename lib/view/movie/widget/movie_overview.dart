import 'package:flutter/material.dart';
import 'package:movie_nest/core/app_colors.dart';

class CustomMovieOverview extends StatelessWidget {
  final String? description;

  const CustomMovieOverview({
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
            color: AppColors.txtClr1,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.5,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          overviewText,
          style: TextStyle(
            color: AppColors.txtClr1,
            fontSize: 15,
            height: 1.5,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
