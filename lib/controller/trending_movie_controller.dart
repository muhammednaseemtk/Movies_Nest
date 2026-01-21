import 'package:flutter/material.dart';
import 'package:movie_nest/model/trending_movie.dart';

class TrendingMovieController extends ChangeNotifier {
  List<TrendingMovie> trendingMovies = [];
  List<TrendingMovie> filteredTrendingMovies = [];
  List<TrendingMovie> trendingWatchList = [];

  
}