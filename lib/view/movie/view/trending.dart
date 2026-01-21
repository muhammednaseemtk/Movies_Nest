import 'package:flutter/material.dart';
import 'package:movie_nest/core/app_colors.dart';
import 'package:movie_nest/core/url.dart';
import 'package:movie_nest/model/trending_movie.dart';
import 'package:movie_nest/controller/upcoming_movie_controller.dart';
import 'package:movie_nest/view/movie/widget/movie_button.dart';
import 'package:movie_nest/view/movie/widget/movie_header.dart';
import 'package:movie_nest/view/movie/widget/movie_overview.dart';
import 'package:movie_nest/view/movie/widget/movie_title.dart';
import 'package:provider/provider.dart';

class TrendingScreen extends StatefulWidget {
  final TrendingMovie data;
  const TrendingScreen({super.key, required this.data});

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  late Future<void> trendingFuture;

  @override
  void initState() {
    super.initState();
    trendingFuture = context.read<MovieController>().fetchTrendingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: FutureBuilder(
        future: trendingFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.txtClr2),
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Something went wrong',
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          return Consumer<MovieController>(
            builder: (context, movieProvider, child) {
              if (movieProvider.trendingMovies.isEmpty) {
                return Center(
                  child: Text('No data', style: TextStyle(color: Colors.white)),
                );
              }

              return SingleChildScrollView(
                child: Column(
                  children: [
                    CustomMovieHeader(
                      imagePath: '${Url.imageBaseUrl}${widget.data.posterPath}',
                      onBack: () => Navigator.pop(context),
                      onShare: () {},
                    ),

                    SizedBox(height: 16),

                    CustomMovieTitle(
                      title: widget.data.title,
                      rating: widget.data.voteAverage?.toStringAsFixed(1),
                      date: widget.data.releaseDates ?? '',
                      quality: '4K HDR',
                    ),

                    SizedBox(height: 20),

                    CustomMovieButtons(
                      onPlayTrailer: () {},
                      onAddToWatchlist: () {
                        if (movieProvider.isTrendingWatchList(
                          widget.data.title ?? '',
                        )) {
                          movieProvider.removeTrendingWatchList(widget.data);
                        } else {
                          movieProvider.addTrendingWatchList(widget.data);
                        }
                      },
                      isInWatchlist: movieProvider.isTrendingWatchList(
                        widget.data.title ?? '',
                      ),
                    ),

                    SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomMovieOverview(
                        description: widget.data.overView,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
