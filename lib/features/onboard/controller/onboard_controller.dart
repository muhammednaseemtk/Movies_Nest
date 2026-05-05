import 'package:flutter/material.dart';
import '../model/onboard_model.dart';
import '../service/onboard_service.dart';

class OnboardController extends ChangeNotifier {
  final OnboardService service = OnboardService();

  List<OnboardModel> movies = [];
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
    } catch (e) {
      debugPrint(e.toString());
    }

    isLoading = false;
    notifyListeners();
  }
}