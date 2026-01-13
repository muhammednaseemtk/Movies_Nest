import 'package:flutter/material.dart';
import 'package:movie_nest/core/app_colors.dart';
import 'package:movie_nest/widget/banner.dart';
import 'package:movie_nest/widget/movie_card.dart';
import 'package:movie_nest/widget/moviel_ist.dart';
import 'package:movie_nest/widget/see_all.dart';
import 'package:movie_nest/widget/top_movie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTopMovie(),
              CustomBanner(imagePath: 'asset/image/anime.jpg', category: 'Adventure', title: 'Jujutsu Kaisen'),
               SizedBox(height: 25),
               CustomSeeAll(title: 'Trending Movies'),
               SizedBox(height: 10,),
               CustomMovieList(imagePath: 'asset/image/it.jpg'),
               SizedBox(height: 10,),
               CustomSeeAll(title: 'Popular Movies'),
               SizedBox(height: 10,),
               CustomMovieList(imagePath: 'asset/image/it.jpg'),
               SizedBox(height: 10,),
               CustomMovieCard(imagePath: 'asset/image/anime.jpg', title: 'Jujutsu Kaisen', rating: 8.9, year: '2000', txt: 'Adventure',)
            ],
          ),
        ),
      ),
    );
  }
}
