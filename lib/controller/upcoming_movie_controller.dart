import 'package:flutter/material.dart';
import 'package:movie_nest/model/trending_movie.dart';
import 'package:movie_nest/model/tvshow_movie.dart';
import 'package:movie_nest/model/upcoming_movie.dart';
import 'package:movie_nest/service/movies_service.dart';

class MovieController extends ChangeNotifier {
  final MovieService service = MovieService();

  List<UpcomingMovie> upcomingMovies = [];
  List<UpcomingMovie> upcomingWatchList = [];

  List<TrendingMovie> trendingMovies = [];
  List<TrendingMovie> filteredTrendingMovies = [];
  List<TrendingMovie> trendingWatchList = [];

  List<TvshowMovie> tvShowMovies = [];
  List<TvshowMovie> tvShowWatchList = [];

  bool isLoading = false;

  bool isTrendingWatchList(String title) {
    return trendingWatchList.any((movie) => movie.title == title);
  }
  bool isUpcomingWatchList(String title) {
    return upcomingWatchList.any((movie) => movie.originalTitle == title);
  }
  bool isTvshowWatchList(String title) {
    return tvShowWatchList.any((movie) => movie.originalName == title);
  }

  void addTrendingWatchList(TrendingMovie movie) {
    if (!isTrendingWatchList(movie.title ?? '')) {
      trendingWatchList.add(movie);
      notifyListeners();
    }
  }

  void removeTrendingWatchList(TrendingMovie movie) {
    trendingWatchList.removeWhere((m) => m.id == movie.id);
    notifyListeners();
  }

  void addUpcomingWatchList(UpcomingMovie movie) {
    if (!isUpcomingWatchList(movie.originalTitle ?? '')) {
      upcomingWatchList.add(movie);
      notifyListeners();
    }
  }

  void removeUpcomingWatchList(UpcomingMovie movie) {
    upcomingWatchList.removeWhere((m) => m.id == movie.id);
    notifyListeners();
  }

  void addTvshowWatchList(TvshowMovie movie) {
    if (!isTvshowWatchList(movie.originalName ?? '')) {
      tvShowWatchList.add(movie);
      notifyListeners();
    }
  }

  void removeTvshowWatchList(TvshowMovie movie) {
    tvShowWatchList.removeWhere((m) => m.id == movie.id);
    notifyListeners();
  }

  void searchMovies(String query) {
    if (query.isEmpty) {
      filteredTrendingMovies = trendingMovies;
    } else {
      filteredTrendingMovies = trendingMovies
          .where(
            (movie) =>
                (movie.title ?? '').toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    }
    notifyListeners();
  }
}


