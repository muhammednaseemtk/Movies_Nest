import 'package:flutter/material.dart';
import 'package:movie_nest/service/movies_service.dart';
import 'package:movie_nest/model/trending_movie.dart';
import 'package:movie_nest/model/upcoming_movie.dart';
import 'package:movie_nest/model/tvshow_movie.dart';

class HomeController extends ChangeNotifier {
  final MovieService service = MovieService();

  bool isLoading = false;

  List<TrendingMovie> trendingMovies = [];
  List<UpcomingMovie> upcomingMovies = [];
  List<TvshowMovie> tvShowMovies = [];

  Future<void> fetchHomeData() async {
    try {
      isLoading = true;
      notifyListeners();

      final results = await Future.wait([
        service.fetchTrendingMovies(),
        service.fetchUpcomingMovies(),
        service.fetchTvShowsMovies(),
      ]);

      trendingMovies = results[0] as List<TrendingMovie>;
      upcomingMovies = results[1] as List<UpcomingMovie>;
      tvShowMovies = results[2] as List<TvshowMovie>;
    } catch (e) {
      debugPrint("Home Error: $e");
    }

    isLoading = false;
    notifyListeners();
  }
}