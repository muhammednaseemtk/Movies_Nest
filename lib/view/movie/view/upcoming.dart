import 'package:flutter/material.dart';
import 'package:movie_nest/core/app_colors.dart';
import 'package:movie_nest/core/url.dart';
import 'package:movie_nest/model/upcoming_movie.dart';
import 'package:movie_nest/controller/upcoming_movie_controller.dart';
import 'package:movie_nest/view/movie/widget/movie_button.dart';
import 'package:movie_nest/view/movie/widget/movie_header.dart';
import 'package:movie_nest/view/movie/widget/movie_overview.dart';
import 'package:movie_nest/view/movie/widget/movie_title.dart';
import 'package:provider/provider.dart';

class UpcomingScreen extends StatefulWidget {
  final UpcomingMovie data;
  const UpcomingScreen({super.key, required this.data});

  @override
  State<UpcomingScreen> createState() => _UpcomingScreenState();
}

class _UpcomingScreenState extends State<UpcomingScreen> {
  late Future<void> upcomingFuture;

  @override
  void initState() {
    super.initState();
    upcomingFuture = context.read<MovieController>().fetchUpcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: FutureBuilder(
        future: upcomingFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
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
              if (movieProvider.upcomingMovies.isEmpty) {
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
                      title: widget.data.originalTitle ?? '',
                      rating: widget.data.voteAverage?.toStringAsFixed(1) ?? '',
                      year: widget.data.releaseDate?.substring(0, 4),
                      date: widget.data.releaseDate ?? '',
                      quality: '4K HDR',
                    ),

                    SizedBox(height: 20),

                    CustomMovieButtons(
                      onPlayTrailer: () {},
                      onAddToWatchlist: () {
                        if (movieProvider.isUpcomingWatchList(
                          widget.data.originalTitle ?? '',
                        )) {
                          movieProvider.removeUpcomingWatchList(widget.data);
                        } else {
                          movieProvider.addUpcomingWatchList(widget.data);
                        }
                      },
                      isInWatchlist: movieProvider.isUpcomingWatchList(
                        widget.data.originalTitle ?? '',
                      ),
                    ),

                    SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomMovieOverview(
                        description: widget.data.overview ?? '',
                      ),
                    ),

                    SizedBox(height: 10),
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
