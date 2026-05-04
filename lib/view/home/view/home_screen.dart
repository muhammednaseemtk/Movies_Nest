import 'package:flutter/material.dart';
import 'package:movie_nest/view/home/controller/home_controller.dart';
import 'package:movie_nest/core/constants/app_colors.dart';
import 'package:movie_nest/view/home/widget/banner.dart';
import 'package:movie_nest/view/home/widget/see_all.dart';
import 'package:movie_nest/view/home/widget/top_movie.dart';
import 'package:movie_nest/view/home/widget/trending_movie_list.dart';
import 'package:movie_nest/view/home/widget/tvshow_movie_list.dart';
import 'package:movie_nest/view/home/widget/upcoming_movie_list.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (context, controller, _) {
        
        if (!controller.isLoading &&
            controller.trendingMovies.isEmpty) {
          Future.microtask(() => controller.fetchHomeData());
        }

        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: SafeArea(
            child: controller.isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.txtClr2,
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTopMovie(),

                        CustomBanner(
                          imagePath: 'asset/image/avatar.avif',
                          category: 'Adventure',
                          title: 'Avatar 3',
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
                  ),
          ),
        );
      },
    );
  }
}