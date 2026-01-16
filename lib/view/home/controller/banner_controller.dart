import 'package:flutter/material.dart';
import 'package:movie_nest/model/upcoming_movie.dart';
import 'package:movie_nest/service/upcoming_movie_service.dart';

class BannerController extends ChangeNotifier {
  final UpcomingMovieService service = UpcomingMovieService();

  UpcomingMovie? bannerMovie;
  bool isLoading = false;

  Future<void> getBannerMovie() async {
    isLoading = true;
    notifyListeners();

    final movies = await service.fetchUpcomingMovies();

    if (movies.isNotEmpty) {
      bannerMovie = movies.first;
    }

    isLoading = false;
    notifyListeners();
  }
}
