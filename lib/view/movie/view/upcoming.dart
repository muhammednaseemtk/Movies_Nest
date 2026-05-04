import 'package:flutter/material.dart';
import 'package:movie_nest/view/movie/controller/upcoming_movie_controller.dart';
import 'package:movie_nest/core/constants/app_colors.dart';
import 'package:movie_nest/core/constants/url.dart';
import 'package:movie_nest/view/movie/model/upcoming_movie.dart';
import 'package:movie_nest/view/movie/widget/movie_button.dart';
import 'package:movie_nest/view/movie/widget/movie_header.dart';
import 'package:movie_nest/view/movie/widget/movie_overview.dart';
import 'package:movie_nest/view/movie/widget/movie_title.dart';
import 'package:provider/provider.dart';

class UpcomingScreen extends StatelessWidget {
  final UpcomingMovie data;

  const UpcomingScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Consumer<UpcomingMovieController>(
      builder: (context, controller, _) {

        if (!controller.isLoading && controller.upcomingMovies.isEmpty) {
          Future.microtask(() => controller.fetchUpcomingMovies());
        }

        if (controller.isLoading) {
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            body: Center(
              child: CircularProgressIndicator(
                color: AppColors.txtClr2,
              ),
            ),
          );
        }

        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                CustomMovieHeader(
                  imagePath:
                      '${Url.imageBaseUrl}${data.posterPath}',
                  onBack: () => Navigator.pop(context),
                  onShare: () {},
                ),

                const SizedBox(height: 16),

                CustomMovieTitle(
                  title: data.originalTitle ?? '',
                  rating:
                      data.voteAverage?.toStringAsFixed(1) ?? '',
                  year: data.releaseDate?.substring(0, 4),
                  date: data.releaseDate ?? '',
                  quality: '4K HDR',
                ),

                const SizedBox(height: 20),

                CustomMovieButtons(
                  onPlayTrailer: () {},
                  onAddToWatchlist: () {
                    controller.toggleWatchList(data);
                  },
                  isInWatchlist: controller
                      .isInWatchList(data.originalTitle ?? ''),
                ),

                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomMovieOverview(
                    description: data.overview ?? '',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}