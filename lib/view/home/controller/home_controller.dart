import 'package:flutter/material.dart';
import 'package:movie_nest/view/movie/model/trending_movie.dart';
import 'package:movie_nest/view/movie/model/tvshow_movie.dart';
import 'package:movie_nest/view/movie/model/upcoming_movie.dart';
import 'package:movie_nest/view/movie/service/trending_service.dart';
import 'package:movie_nest/view/movie/service/tvshow_service.dart';
import 'package:movie_nest/view/movie/service/upcoming_service.dart';


class HomeController extends ChangeNotifier {
  final TrendingService trendingService = TrendingService();
  final UpcomingService upcomingService = UpcomingService();
  final TvShowService tvService = TvShowService();

  bool isLoading = false;
  bool isFetched = false;

  List<TrendingMovie> trendingMovies = [];
  List<UpcomingMovie> upcomingMovies = [];
  List<TvshowMovie> tvShowMovies = [];

  Future<void> fetchHomeData() async {
    if (isFetched) return;

    try {
      isLoading = true;
      notifyListeners();

      final trending = await trendingService.fetchTrendingMovies();
      final upcoming = await upcomingService.fetchUpcomingMovies();
      final tvShows = await tvService.fetchTvShows();

      trendingMovies = trending;
      upcomingMovies = upcoming;
      tvShowMovies = tvShows;

      isFetched = true;

    } catch (e) {
      debugPrint("Home Error: $e");
    }

    isLoading = false;
    notifyListeners();
  }
}