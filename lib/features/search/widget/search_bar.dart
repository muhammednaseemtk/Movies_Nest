import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:movie_nest/features/movie/controller/trending_movie_controller.dart';
import 'package:movie_nest/core/constants/app_colors.dart';
import 'package:provider/provider.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: AppColors.txtfld,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(Iconsax.search_normal_copy, color: AppColors.white54),

          const SizedBox(width: 10),

          Expanded(
            child: TextField(
              style: TextStyle(color: AppColors.white),
              cursorColor: AppColors.white54,
              decoration: InputDecoration(
                hintText: "Movies....",
                hintStyle: TextStyle(color: AppColors.white54),
                border: InputBorder.none,
              ),

              onChanged: (value) {
                context.read<TrendingMovieController>().searchMovies(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
