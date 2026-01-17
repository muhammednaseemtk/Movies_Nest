import 'package:flutter/material.dart';
import 'package:movie_nest/controller/movie_controller.dart';
import 'package:movie_nest/core/app_colors.dart';
import 'package:movie_nest/core/url.dart';
import 'package:movie_nest/view/home/widget/banner.dart';
import 'package:movie_nest/view/home/widget/movie_card.dart';
import 'package:movie_nest/view/home/widget/see_all.dart';
import 'package:movie_nest/view/home/widget/top_movie.dart';
import 'package:movie_nest/view/home/widget/trending_movie_list.dart';
import 'package:movie_nest/view/home/widget/tvshow_movie_list.dart';
import 'package:movie_nest/view/home/widget/upcoming_movie_list.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<void> _homeData;

  @override
  void initState() {
    super.initState();
    _homeData = context.read<MovieController>().fetchHomeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: FutureBuilder(
          future: _homeData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(color: AppColors.txtClr2),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Something went wrong',
                  style: TextStyle(color: AppColors.txtClr),
                ),
              );
            }

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTopMovie(),
                  CustomBanner(
                    imagePath: 'asset/image/it1.jpg',
                    category: 'Horror',
                    title: 'IT',
                  ),
                  SizedBox(height: 25),
                  CustomSeeAll(title: 'Trending Movies'),
                  SizedBox(height: 10),
                  CustomTrendingMovieList(),
                  SizedBox(height: 20),
                  CustomSeeAll(title: 'Upcoming Movies'),
                  SizedBox(height: 10),
                  CustomUpcomingMovieList(),
                  SizedBox(height: 20),
                  CustomSeeAll(title: 'Tv Shows'),
                  SizedBox(height: 10),
                  CustomTvShowMovieList(),
                  SizedBox(height: 20),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
