import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:movie_nest/controller/upcoming_movie_controller.dart';
import 'package:movie_nest/core/app_colors.dart';
import 'package:movie_nest/core/url.dart';
import 'package:movie_nest/view/watch%20list/widget/watch_card.dart';
import 'package:provider/provider.dart';

class WatchListScreen extends StatelessWidget {
  const WatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'WATCH LIST',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.btnClr,
                fontSize: 22,
              ),
            ),
            Icon(EneftyIcons.play_cricle_bold, color: AppColors.txtClr),
          ],
        ),
      ),
      body: SafeArea(
        child: Consumer<MovieController>(
          builder: (context, value, child) {
            final watchTrendingList = value.trendingWatchList;
            final watchTvshowList = value.tvShowWatchList;
            final watchUpcomingList = value.upcomingWatchList;
            if (watchTrendingList.isEmpty && watchTvshowList.isEmpty && watchUpcomingList.isEmpty) {
              return Center(
                child: Text(
                  'No movies in watchlist',
                  style: TextStyle(color: Colors.white54,fontWeight: FontWeight.bold),
                ),
              );
            }
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  ...watchTrendingList.map(
                    (movie) => CustomWatchCard(
                      image: '${Url.imageBaseUrl} ${movie.posterPath}',
                      title: movie.title ?? '',
                      rating: movie.voteAverage?.toStringAsFixed(1) ?? '0.0',
                      year: movie.releaseDates ?? '',
                      onRemove: (){
                        value.removeTrendingWatchList(movie);
                      },
                    ),
                  ),
                  ...watchUpcomingList.map(
                    (movie) => CustomWatchCard(
                      image: '${Url.imageBaseUrl} ${movie.posterPath}',
                      title: movie.originalTitle ?? '',
                      rating: movie.voteAverage?.toStringAsFixed(1) ?? '0.0',
                      year: movie.releaseDate ?? '',
                      onRemove: (){
                        value.removeUpcomingWatchList(movie);
                      },
                    ),
                  ),
                  ...watchTvshowList.map(
                    (movie) => CustomWatchCard(
                      image: '${Url.imageBaseUrl} ${movie.posterPath}',
                      title: movie.originalName ?? '',
                      rating: movie.voteAverage?.toStringAsFixed(1) ?? '0.0',
                      year: movie.firstAirDate ?? '',
                      onRemove: (){
                        value.removeTvshowWatchList(movie);
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
