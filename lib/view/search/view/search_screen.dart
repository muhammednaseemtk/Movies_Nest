import 'package:flutter/material.dart';
import 'package:movie_nest/core/app_colors.dart';
import 'package:movie_nest/view/search/widget/recommended_movie.dart';
import 'package:movie_nest/view/search/widget/search_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSearchBar(),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'Recommended For You',
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.txtClr,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomRecommendedMovie(image: 'asset/image/pp.jpg', title: 'naruto', year: '2000', rating: '8.9'),
                    CustomRecommendedMovie(image: 'asset/image/pp.jpg', title: 'naruto', year: '2000', rating: '8.9'),
                    CustomRecommendedMovie(image: 'asset/image/pp.jpg', title: 'naruto', year: '2000', rating: '8.9'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomRecommendedMovie(image: 'asset/image/pp.jpg', title: 'naruto', year: '2000', rating: '8.9'),
                    CustomRecommendedMovie(image: 'asset/image/pp.jpg', title: 'naruto', year: '2000', rating: '8.9'),
                    CustomRecommendedMovie(image: 'asset/image/pp.jpg', title: 'naruto', year: '2000', rating: '8.9'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomRecommendedMovie(image: 'asset/image/pp.jpg', title: 'naruto', year: '2000', rating: '8.9'),
                    CustomRecommendedMovie(image: 'asset/image/pp.jpg', title: 'naruto', year: '2000', rating: '8.9'),
                    CustomRecommendedMovie(image: 'asset/image/pp.jpg', title: 'naruto', year: '2000', rating: '8.9'),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
