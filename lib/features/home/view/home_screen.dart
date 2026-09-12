import 'package:flutter/material.dart';
import 'package:movie_nest/features/home/controller/home_controller.dart';
import 'package:movie_nest/core/constants/app_colors.dart';
import 'package:movie_nest/features/home/widget/banner.dart';
import 'package:movie_nest/features/home/widget/see_all.dart';
import 'package:movie_nest/features/home/widget/shimmer_skeleton.dart';
import 'package:movie_nest/features/home/widget/top_movie.dart';
import 'package:movie_nest/features/home/widget/trending_movie_list.dart';
import 'package:movie_nest/features/home/widget/tvshow_movie_list.dart';
import 'package:movie_nest/features/home/widget/upcoming_movie_list.dart';
import 'package:movie_nest/features/movie/controller/trending_movie_controller.dart';
import 'package:movie_nest/features/movie/controller/upcoming_movie_controller.dart';
import 'package:movie_nest/features/movie/controller/tvshow_movie_controller.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _hasInitialized = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_hasInitialized) {
        _hasInitialized = true;
        _fetchData();
      }
    });
  }

  void _fetchData() {
    final homeCtrl = context.read<HomeController>();
    homeCtrl.fetchHomeData(
      trendingCtrl: context.read<TrendingMovieController>(),
      upcomingCtrl: context.read<UpcomingMovieController>(),
      tvShowCtrl: context.read<TvShowMovieController>(),
    );
  }

  void _retry() {
    final homeCtrl = context.read<HomeController>();
    homeCtrl.retry(
      trendingCtrl: context.read<TrendingMovieController>(),
      upcomingCtrl: context.read<UpcomingMovieController>(),
      tvShowCtrl: context.read<TvShowMovieController>(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final homeCtrl = context.watch<HomeController>();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: homeCtrl.isLoading
            ? const SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: HomeScreenSkeleton(),
              )
            : homeCtrl.hasError && homeCtrl.isFetched == false && !_hasData()
                ? _buildErrorState()
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TopMovie(),
                        const CustomBanner(
                          imagePath: 'asset/image/movie.jpg',
                          category: 'Adventure',
                          title: 'One Piece',
                        ),
                        const SizedBox(height: 25),
                        const CustomSeeAll(title: 'Trending Movies'),
                        const SizedBox(height: 10),
                        const TrendingMovieList(),
                        const SizedBox(height: 20),
                        const CustomSeeAll(title: 'Upcoming Movies'),
                        const SizedBox(height: 10),
                        const UpcomingMovieList(),
                        const SizedBox(height: 20),
                        const CustomSeeAll(title: 'Tv Shows'),
                        const SizedBox(height: 10),
                        const TvShowMovieList(),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
      ),
    );
  }

  bool _hasData() {
    final trending = context.read<TrendingMovieController>().trendingMovies;
    final upcoming = context.read<UpcomingMovieController>().upcomingMovies;
    final tvShows = context.read<TvShowMovieController>().tvShows;
    return trending.isNotEmpty || upcoming.isNotEmpty || tvShows.isNotEmpty;
  }

  Widget _buildErrorState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.cloud_off_rounded,
              size: 64,
              color: AppColors.white24,
            ),
            const SizedBox(height: 16),
            const Text(
              'Something went wrong',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Please check your connection and try again.',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.white54, fontSize: 14),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _retry,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.btnClr,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon:
                  const Icon(Icons.refresh, color: AppColors.white, size: 20),
              label: const Text(
                'Retry',
                style: TextStyle(color: AppColors.white, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
