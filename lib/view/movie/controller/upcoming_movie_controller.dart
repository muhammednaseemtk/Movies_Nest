import 'package:flutter/material.dart';
import 'package:movie_nest/view/movie/model/upcoming_movie.dart';
import 'package:movie_nest/view/movie/service/upcoming_service.dart';

class UpcomingMovieController extends ChangeNotifier {
  final UpcomingService service = UpcomingService();

  bool isLoading = false;

  List<UpcomingMovie> upcomingMovies = [];
  List<UpcomingMovie> watchList = [];

  Future<void> fetchUpcomingMovies() async {
    try {
      isLoading = true;
      notifyListeners();

      upcomingMovies = await service.fetchUpcomingMovies();
    } catch (e) {
      debugPrint("Upcoming Error: $e");
    }

    isLoading = false;
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