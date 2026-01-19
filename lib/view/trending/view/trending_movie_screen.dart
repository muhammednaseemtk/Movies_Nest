import 'package:flutter/material.dart';
import 'package:movie_nest/core/app_colors.dart';

class TrendingMovieScreen extends StatelessWidget {
  const TrendingMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Text(
          'TRENDING MOVIES',
          style: TextStyle(
            color: AppColors.txtClr2,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(children: [
        ],
      ),
    );
  }
}
