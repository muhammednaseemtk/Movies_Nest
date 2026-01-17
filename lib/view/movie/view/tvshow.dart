import 'package:flutter/material.dart';
import 'package:movie_nest/core/app_colors.dart';
import 'package:movie_nest/controller/movie_controller.dart';
import 'package:movie_nest/core/url.dart';
import 'package:movie_nest/model/tvshow_movie.dart';
import 'package:movie_nest/view/movie/widget/movie_button.dart';
import 'package:movie_nest/view/movie/widget/movie_header.dart';
import 'package:movie_nest/view/movie/widget/movie_overview.dart';
import 'package:movie_nest/view/movie/widget/movie_title.dart';
import 'package:provider/provider.dart';

class TvShowScreen extends StatefulWidget {
  final TvshowMovie data;
  const TvShowScreen({super.key,required this.data});

  @override
  State<TvShowScreen> createState() => _TvShowScreenState();
}

class _TvShowScreenState extends State<TvShowScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<MovieController>().fetchTvShowsMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body:Consumer<MovieController>(
        builder: (context, movieProvider, child) {
          if (movieProvider.isLoading) {
            return const Center(child: CircularProgressIndicator(color: AppColors.txtClr2,));
          }

          if (movieProvider.tvShowMovies.isEmpty) {
            return const Center(child: Text('No data'));
          }

          final movie = movieProvider.tvShowMovies.first;

          return SingleChildScrollView(
            child: Column(
              children: [
                CustomMovieHeader(
                  isFavourite: movieProvider.isFavourite,
                  imagePath: '${Url.imageBaseUrl}${widget.data.posterPath}',
                  onBack: () => Navigator.pop(context),
                  onShare: () {},
                  onFavourite: movieProvider.toggleFavourite,
                ),

                SizedBox(height: 16),

                CustomMovieTitle(
                  title: '${widget.data.originalName}',
                  rating: '${widget.data.voteAverage}',
                  date: '${widget.data.firstAirDate}',
                  quality: '4K HDR',
                ),
                SizedBox(height: 20),

                CustomMovieButtons(
                  onPlayTrailer: () {},
                  onAddToWatchlist: movieProvider.toggleFavourite,
                  isInWatchlist: movieProvider.isFavourite,
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomMovieOverview(description: '${widget.data.overView}'),
                ),
                SizedBox(height: 10),
              ],
            ),
          );
        },
      ),
    );
  }
}
