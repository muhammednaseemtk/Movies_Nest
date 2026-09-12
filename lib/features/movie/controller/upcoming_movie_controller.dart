import 'package:flutter/material.dart';
import 'package:movie_nest/features/movie/model/upcoming_movie.dart';
import 'package:movie_nest/features/movie/service/upcoming_service.dart';

class UpcomingMovieController extends ChangeNotifier {
  final UpcomingService service = UpcomingService();

  bool isLoading = false;
  bool hasError = false;
  String errorMessage = '';
  bool _isFetching = false;

  List<UpcomingMovie> upcomingMovies = [];
  List<UpcomingMovie> watchList = [];

  Future<void> fetchUpcomingMovies() async {
    if (_isFetching) return;
    _isFetching = true;

    try {
      isLoading = true;
      hasError = false;
      errorMessage = '';
      notifyListeners();

      upcomingMovies = await service.fetchUpcomingMovies();
      hasError = false;
    } catch (e) {
      debugPrint("[Upcoming] Error: $e");
      hasError = true;
      errorMessage = 'Failed to load upcoming movies.';
    }

    isLoading = false;
    _isFetching = false;
    notifyListeners();
  }

  bool isInWatchList(String title) {
    return watchList.any((m) => m.originalTitle == title);
  }

  void toggleWatchList(UpcomingMovie movie) {
    if (isInWatchList(movie.originalTitle ?? '')) {
      watchList.removeWhere((m) => m.id == movie.id);
    } else {
      watchList.add(movie);
    }
    notifyListeners();
  }
}
