import 'package:flutter/material.dart';
import 'package:movie_nest/core/app_colors.dart';
import 'package:movie_nest/controller/upcoming_movie_controller.dart';
import 'package:movie_nest/core/url.dart';
import 'package:movie_nest/model/tvshow_movie.dart';
import 'package:movie_nest/view/movie/widget/movie_button.dart';
import 'package:movie_nest/view/movie/widget/movie_header.dart';
import 'package:movie_nest/view/movie/widget/movie_overview.dart';
import 'package:movie_nest/view/movie/widget/movie_title.dart';
import 'package:provider/provider.dart';

class TvShowScreen extends StatefulWidget {
  final TvshowMovie data;
  const TvShowScreen({super.key, required this.data});

  @override
  State<TvShowScreen> createState() => _TvShowScreenState();
}

class _TvShowScreenState extends State<TvShowScreen> {
  late Future<void> tvShowFuture;

  @override
  void initState() {
    super.initState();
    tvShowFuture = context.read<MovieController>().fetchTvShowsMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: FutureBuilder(
        future: tvShowFuture,
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
              if (movieProvider.tvShowMovies.isEmpty) {
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
                      title: widget.data.originalName ?? '',
                      rating: widget.data.voteAverage?.toStringAsFixed(1) ?? '',
                      date: widget.data.firstAirDate ?? '',
                      quality: '4K HDR',
                    ),

                    SizedBox(height: 20),

                    CustomMovieButtons(
                      onPlayTrailer: () {},
                      onAddToWatchlist: () {
                        if (movieProvider.isTvshowWatchList(
                          widget.data.originalName ?? '',
                        )) {
                          movieProvider.removeTvshowWatchList(widget.data);
                        } else {
                          movieProvider.addTvshowWatchList(widget.data);
                        }
                      },
                      isInWatchlist: movieProvider.isTvshowWatchList(
                        widget.data.originalName ?? '',
                      ),
                    ),

                    SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomMovieOverview(
                        description: widget.data.overView ?? '',
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
