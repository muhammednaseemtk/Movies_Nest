import 'package:flutter/material.dart';
import 'package:movie_nest/core/constants/url.dart';
import 'package:palette_generator_master/palette_generator_master.dart';
import '../model/onboard_model.dart';
import '../service/onboard_service.dart';

class OnboardController extends ChangeNotifier {
  final OnboardService service = OnboardService();

  List<OnboardModel> movies = [];

  final Map<String, Color> movieColors = {};

  bool isLoading = false;

  OnboardController() {
    init();
  }

  void init() {
    getMovies();
  }

  Future<void> getMovies() async {
    isLoading = true;
    notifyListeners();

    try {
      movies = await service.fetchPopularMovies();

      isLoading = false;
      notifyListeners();

      Future.microtask(() {
        preloadMovieColors();
      });
    } catch (e) {
      debugPrint(e.toString());

      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> preloadMovieColors() async {
    for (final movie in movies) {
      final imageUrl = Url.imageBaseUrl + movie.posterPath;

      if (movieColors.containsKey(imageUrl)) {
        continue;
      }

      try {
        final palette = await PaletteGeneratorMaster.fromImageProvider(
          ResizeImage(NetworkImage(imageUrl), width: 200),
        );

        movieColors[imageUrl] = palette.dominantColor?.color ?? Colors.black;
      } catch (e) {
        movieColors[imageUrl] = Colors.black;
      }
    }

    notifyListeners();
  }

  Color getMovieColor(String imageUrl) {
    return movieColors[imageUrl] ?? Colors.black;
  }
}
