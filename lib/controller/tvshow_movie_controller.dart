import 'package:flutter/material.dart';
import 'package:movie_nest/model/tvshow_movie.dart';
import 'package:movie_nest/service/movies_service.dart';

class TvShowMovieController extends ChangeNotifier {
  final MovieService service = MovieService();

  bool isLoading = false;

  List<TvshowMovie> tvShows = [];
  List<TvshowMovie> watchList = [];

  Future<void> fetchTvShows() async {
    try {
      isLoading = true;
      notifyListeners();

      tvShows = await service.fetchTvShowsMovies();
    } catch (e) {
      debugPrint("TV Error: $e");
    }

    isLoading = false;
    notifyListeners();
  }

  bool isInWatchList(String title) {
    return watchList.any((m) => m.originalName == title);
  }

  void toggleWatchList(TvshowMovie movie) {
    if (isInWatchList(movie.originalName ?? '')) {
      watchList.removeWhere((m) => m.id == movie.id);
    } else {
      watchList.add(movie);
    }
    notifyListeners();
  }
}