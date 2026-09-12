import 'package:flutter/material.dart';
import 'package:movie_nest/features/movie/controller/trending_movie_controller.dart';
import 'package:movie_nest/features/movie/controller/upcoming_movie_controller.dart';
import 'package:movie_nest/features/movie/controller/tvshow_movie_controller.dart';

class HomeController extends ChangeNotifier {
  bool isLoading = false;
  bool isFetched = false;
  bool hasError = false;
  String errorMessage = '';
  bool _isFetching = false;

  Future<void> fetchHomeData({
    required TrendingMovieController trendingCtrl,
    required UpcomingMovieController upcomingCtrl,
    required TvShowMovieController tvShowCtrl,
  }) async {
    if (isFetched || _isFetching) return;
    _isFetching = true;

    try {
      isLoading = true;
      hasError = false;
      errorMessage = '';
      notifyListeners();

      await trendingCtrl.fetchTrendingMovies();
      await upcomingCtrl.fetchUpcomingMovies();
      await tvShowCtrl.fetchTvShows();

      final anyError = trendingCtrl.hasError ||
          upcomingCtrl.hasError ||
          tvShowCtrl.hasError;

      if (anyError && trendingCtrl.trendingMovies.isEmpty &&
          upcomingCtrl.upcomingMovies.isEmpty &&
          tvShowCtrl.tvShows.isEmpty) {
        hasError = true;
        errorMessage = 'Failed to load content. Please try again.';
      } else {
        isFetched = true;
      }
    } catch (e) {
      debugPrint("[HomeController] Error: $e");
      hasError = true;
      errorMessage = 'An unexpected error occurred.';
    }

    isLoading = false;
    _isFetching = false;
    notifyListeners();
  }

  void retry({
    required TrendingMovieController trendingCtrl,
    required UpcomingMovieController upcomingCtrl,
    required TvShowMovieController tvShowCtrl,
  }) {
    isFetched = false;
    _isFetching = false;
    trendingCtrl.trendingMovies = [];
    upcomingCtrl.upcomingMovies = [];
    tvShowCtrl.tvShows = [];
    fetchHomeData(
      trendingCtrl: trendingCtrl,
      upcomingCtrl: upcomingCtrl,
      tvShowCtrl: tvShowCtrl,
    );
  }
}
