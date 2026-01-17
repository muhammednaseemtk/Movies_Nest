import 'package:flutter/material.dart';
import 'package:movie_nest/core/app_colors.dart';
import 'package:movie_nest/core/url.dart';
import 'package:movie_nest/model/upcoming_movie.dart';
import 'package:movie_nest/controller/movie_controller.dart';
import 'package:movie_nest/view/movie/widget/movie_button.dart';
import 'package:movie_nest/view/movie/widget/movie_header.dart';
import 'package:movie_nest/view/movie/widget/movie_overview.dart';
import 'package:movie_nest/view/movie/widget/movie_title.dart';
import 'package:provider/provider.dart';

class UpcomingScreen extends StatefulWidget {
  final UpcomingMovie data;
  const UpcomingScreen({super.key,required this.data});

  @override
  State<UpcomingScreen> createState() => _UpcomingScreenState();
}

class _UpcomingScreenState extends State<UpcomingScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<MovieController>().fetchUpcomingMovies();
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

          if (movieProvider.upcomingMovies.isEmpty) {
            return const Center(child: Text('No data'));
          }

          final movie = movieProvider.upcomingMovies.first;

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
                  title: '${widget.data.originalTitle}',
                  rating: '${widget.data.voteAverage}',
                  year: movie.releaseDate?.substring(0, 4),
                  date: '${widget.data.releaseDate}',
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
                  child: CustomMovieOverview(description: '${widget.data.overview}'),
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
