import 'package:flutter/material.dart';
import 'package:movie_nest/core/url.dart';
import 'package:movie_nest/model/trending_movie.dart';
import 'package:movie_nest/model/tvshow_movie.dart';
import 'package:movie_nest/model/upcoming_movie.dart';
import 'package:movie_nest/service/movies_service.dart';

class MovieController extends ChangeNotifier {
  final MovieService service = MovieService();
  List<UpcomingMovie> upcomingMovies = [];
  List<TrendingMovie> trendingMovies = [];
  List<TvshowMovie> tvShowMovies = [];
  bool isLoading = false;

  bool isFavourites = false;
  bool get isFavourite => isFavourites;

  void toggleFavourite() {
    isFavourites = !isFavourites;
    notifyListeners();
  }

  Future<void> fetchUpcomingMovies() async {
    isLoading = true;
    notifyListeners();

    try {
      upcomingMovies = await service.fetchUpcomingMovies();
    } catch (e) {
      debugPrint('ERROR: $e');
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> fetchTrendingMovies() async {
    isLoading = true;
    notifyListeners();

    try {
      trendingMovies = await service.fetchTrendingMovies();
    } catch (e) {
      debugPrint('ERROR: $e');
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> fetchTvShowsMovies() async {
    isLoading = true;
    notifyListeners();

    try {
      tvShowMovies = await service.fetchTvShowsMovies();
    } catch (e) {
      debugPrint('ERROR: $e');
    }

    isLoading = false;
    notifyListeners();
  }

  void setImagePath(String imagePath) {}
}

class MovieImageController extends ChangeNotifier {
  String? imagePath;

  void setImagePath(String? path) {
    imagePath = path;
  }

  ImageProvider get image {
    if (imagePath == null || imagePath!.isEmpty) {
      return const AssetImage('asset/image/it1.jpg');
    }
    return NetworkImage(Url.imageBaseUrl + imagePath!);
  }
}
