import 'package:flutter/material.dart';
import 'package:movie_nest/core/app_colors.dart';
import 'package:movie_nest/view/home/widget/banner.dart';
import 'package:movie_nest/view/home/widget/movie_card.dart';
import 'package:movie_nest/view/home/widget/movie_list.dart';
import 'package:movie_nest/view/home/widget/see_all.dart';
import 'package:movie_nest/view/home/widget/top_movie.dart';
import 'package:movie_nest/view/search/view/search_screen.dart';

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
              CustomTopMovie(onSearchTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen()));
              },),
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
               CustomSeeAll(title: 'Top Rated'),
               CustomMovieCard(imagePath: 'asset/image/anime.jpg', title: 'Jujutsu Kaisen', rating: 8.9, year: '2000', txt: 'Adventure',),
               CustomMovieCard(imagePath: 'asset/image/anime.jpg', title: 'Jujutsu Kaisen', rating: 8.9, year: '2000', txt: 'Adventure',),
               CustomMovieCard(imagePath: 'asset/image/anime.jpg', title: 'Jujutsu Kaisen', rating: 8.9, year: '2000', txt: 'Adventure',),
               CustomMovieCard(imagePath: 'asset/image/anime.jpg', title: 'Jujutsu Kaisen', rating: 8.9, year: '2000', txt: 'Adventure',),
            ],
          ),
        ),
      ),
    );
  }
}
