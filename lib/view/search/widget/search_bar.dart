import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:movie_nest/controller/movie_controller.dart';
import 'package:movie_nest/core/app_colors.dart';
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
        children:  [
          Icon(EneftyIcons.search_normal_outline, color: AppColors.txtClr1),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              style: TextStyle(color: AppColors.txtClr),
              cursorColor: AppColors.txtClr1,
              decoration: InputDecoration(
                hintText: "Movies....",
                hintStyle: TextStyle(color: AppColors.txtClr1),
                border: InputBorder.none,
              ),
              onChanged:(value){
                context
                .read<MovieController>()
                .searchMovies(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
