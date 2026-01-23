import 'package:flutter/material.dart';
import 'package:movie_nest/model/trending_movie.dart';
import 'package:movie_nest/model/tvshow_movie.dart';
import 'package:movie_nest/model/upcoming_movie.dart';
import 'package:movie_nest/service/movies_service.dart';

class HomeController extends ChangeNotifier {
  final MovieService service = MovieService();
   bool isLoading = false;
   List<UpcomingMovie> upcomingMovies = [];
   List<TrendingMovie> trendingMovies = [];
  List<TrendingMovie> filteredTrendingMovies = [];
  List<TvshowMovie> tvShowMovies = [];

Future<void> fetchTrendingMovies() async {
    trendingMovies = await service.fetchTrendingMovies();
    filteredTrendingMovies = trendingMovies;
  }
   
  Future<void> fetchUpcomingMovies() async {
    upcomingMovies = await service.fetchUpcomingMovies();
  }

  Future<void> fetchTvShowsMovies() async {
    tvShowMovies = await service.fetchTvShowsMovies();
  }
  Future<void> fetchHomeData() async {
    isLoading = true;
    notifyListeners();

    await Future.wait([
      fetchTrendingMovies(),
      fetchUpcomingMovies(),
      fetchTvShowsMovies(),
    ]);

    isLoading = false;
    notifyListeners();
  }

}