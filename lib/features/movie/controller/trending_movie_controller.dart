import 'package:flutter/material.dart';
import 'package:movie_nest/features/movie/model/trending_movie.dart';
import 'package:movie_nest/features/movie/service/trending_service.dart';

class TrendingMovieController extends ChangeNotifier {
  final TrendingService service = TrendingService();

  bool isLoading = false;
  bool hasError = false;
  String errorMessage = '';
  bool _isFetching = false;

  List<TrendingMovie> trendingMovies = [];
  List<TrendingMovie> filteredTrendingMovies = [];
  List<TrendingMovie> watchList = [];

  Future<void> fetchTrendingMovies() async {
    if (_isFetching) return;
    _isFetching = true;

    try {
      isLoading = true;
      hasError = false;
      errorMessage = '';
      notifyListeners();

      final data = await service.fetchTrendingMovies();
      trendingMovies = data;
      filteredTrendingMovies = data;
      hasError = false;
    } catch (e) {
      debugPrint("[Trending] Error: $e");
      hasError = true;
      errorMessage = 'Failed to load trending movies.';
    }

    isLoading = false;
    _isFetching = false;
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
