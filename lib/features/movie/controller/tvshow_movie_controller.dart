import 'package:flutter/material.dart';
import 'package:movie_nest/features/movie/model/tvshow_movie.dart';
import 'package:movie_nest/features/movie/service/tvshow_service.dart';

class TvShowMovieController extends ChangeNotifier {
  final TvShowService service = TvShowService();

  bool isLoading = false;
  bool hasError = false;
  String errorMessage = '';
  bool _isFetching = false;

  List<TvshowMovie> tvShows = [];
  List<TvshowMovie> watchList = [];

  Future<void> fetchTvShows() async {
    if (_isFetching) return;
    _isFetching = true;

    try {
      isLoading = true;
      hasError = false;
      errorMessage = '';
      notifyListeners();

      tvShows = await service.fetchTvShows();
      hasError = false;
    } catch (e) {
      debugPrint("[TvShow] Error: $e");
      hasError = true;
      errorMessage = 'Failed to load TV shows.';
    }

    isLoading = false;
    _isFetching = false;
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
