  import 'package:flutter/material.dart';
  import 'package:movie_nest/model/upcoming_movie.dart';
  import 'package:movie_nest/service/upcoming_movie_service.dart';


  class MovieController extends ChangeNotifier {
    final UpcomingMovieService service = UpcomingMovieService();
    List<UpcomingMovie> movies = [];
    bool isLoading = false;

    bool isFavourites = false;
    bool get isFavourite => isFavourites;

    void toggleFavourite() {
      isFavourites = !isFavourites;
      notifyListeners();
    }

    Future<void> fetchMovies() async {
      isLoading = true;
      notifyListeners();

      try {
        movies = await service.fetchUpcomingMovies();
      } catch (e) {
        debugPrint('ERROR: $e');
      }

      isLoading = false;
      notifyListeners();
    }
  }
