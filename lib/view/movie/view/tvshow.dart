import 'package:flutter/material.dart';
import 'package:movie_nest/controller/tvshow_movie_controller.dart';
import 'package:movie_nest/core/app_colors.dart';
import 'package:movie_nest/core/url.dart';
import 'package:movie_nest/model/tvshow_movie.dart';
import 'package:movie_nest/view/movie/widget/movie_button.dart';
import 'package:movie_nest/view/movie/widget/movie_header.dart';
import 'package:movie_nest/view/movie/widget/movie_overview.dart';
import 'package:movie_nest/view/movie/widget/movie_title.dart';
import 'package:provider/provider.dart';

class TvShowScreen extends StatelessWidget {
  final TvshowMovie data;

  const TvShowScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Consumer<TvShowMovieController>(
      builder: (context, controller, _) {

        if (!controller.isLoading && controller.tvShows.isEmpty) {
          Future.microtask(() => controller.fetchTvShows());
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
                  title: data.originalName ?? '',
                  rating:
                      data.voteAverage?.toStringAsFixed(1) ?? '',
                  date: data.firstAirDate ?? '',
                  quality: '4K HDR',
                ),

                const SizedBox(height: 20),

                CustomMovieButtons(
                  onPlayTrailer: () {},
                  onAddToWatchlist: () {
                    controller.toggleWatchList(data);
                  },
                  isInWatchlist: controller
                      .isInWatchList(data.originalName ?? ''),
                ),

                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomMovieOverview(
                    description: data.overView ?? '',
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