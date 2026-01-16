import 'package:flutter/material.dart';
import 'package:movie_nest/core/app_colors.dart';
import 'package:movie_nest/view/home/widget/see_all.dart';
import 'package:movie_nest/view/movie/controller/movie_controller.dart';
import 'package:movie_nest/view/movie/widget/movie_button.dart';
import 'package:movie_nest/view/movie/widget/movie_header.dart';
import 'package:movie_nest/view/movie/widget/movie_overview.dart';
import 'package:movie_nest/view/movie/widget/movie_title.dart';
import 'package:provider/provider.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<MovieController>().fetchMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Consumer<MovieController>(
        builder: (context, movieProvider, child) {
          if (movieProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (movieProvider.movies.isEmpty) {
            return const Center(child: Text('No data'));
          }

          final movie = movieProvider.movies.first;

          return SingleChildScrollView(
            child: Column(
              children: [
                CustomMovieHeader(
                  isFavourite: movieProvider.isFavourite,
                  imagePath: movie.posterPath,
                  onBack: () => Navigator.pop(context),
                  onShare: () {},
                  onFavourite: movieProvider.toggleFavourite,
                ),

                SizedBox(height: 16),

                CustomMovieTitle(
                  title: movie.originalTitle,
                  rating: movie.voteAverage?.toStringAsFixed(1),
                  year: movie.releaseDate?.substring(0, 4),
                  duration: '2h 34m',
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
                  child: CustomMovieOverview(description: movie.overview),
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
