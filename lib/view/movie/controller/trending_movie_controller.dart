import 'package:flutter/material.dart';
import 'package:movie_nest/view/movie/model/trending_movie.dart';
import 'package:movie_nest/view/movie/service/trending_service.dart';

class TrendingMovieController extends ChangeNotifier {
  final TrendingService service = TrendingService();

  bool isLoading = false;

  List<TrendingMovie> trendingMovies = [];
  List<TrendingMovie> filteredTrendingMovies = [];
  List<TrendingMovie> watchList = [];

  Future<void> fetchTrendingMovies() async {
    try {
      isLoading = true;
      notifyListeners();

      final data = await service.fetchTrendingMovies();
      trendingMovies = data;
      filteredTrendingMovies = data;
    } catch (e) {
      debugPrint("Trending Error: $e");
    }

    isLoading = false;
    notifyListeners();
  }

  void searchMovies(String query) {
    if (query.isEmpty) {
      filteredTrendingMovies = trendingMovies;
    } else {
      filteredTrendingMovies = trendingMovies
          .where((movie) =>
              (movie.title ?? '')
                  .toLowerCase()
                  .contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  bool isInWatchList(String title) {
    return watchList.any((m) => m.title == title);
  }

  void toggleWatchList(TrendingMovie movie) {
    if (isInWatchList(movie.title ?? '')) {
      watchList.removeWhere((m) => m.id == movie.id);
    } else {
      watchList.add(movie);
    }
    notifyListeners();
  }
}