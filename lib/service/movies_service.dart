import 'package:dio/dio.dart';
import 'package:movie_nest/core/url.dart';
import 'package:movie_nest/model/trending_movie.dart';
import 'package:movie_nest/model/trending_movie_model.dart';
import 'package:movie_nest/model/tvshow_movie.dart';
import 'package:movie_nest/model/tvshow_movie_model.dart';
import 'package:movie_nest/model/upcoming_movie.dart';
import 'package:movie_nest/model/upcoming_movie_model.dart';

class MovieService {
  final Dio dio = Dio();

  Future<List<TrendingMovie>> fetchTrendingMovies() async {
    final response = await dio.get(Url.trending);

    if (response.statusCode == 200 && response.data != null) {
      final model = TrendingMovieModel.fromJson(response.data);
      return model.results ?? [];
    } else {
      throw Exception('Failed to load trending movies');
    }
  }
   Future<List<UpcomingMovie>> fetchUpcomingMovies() async {
    final response = await dio.get(Url.upcoming);

    if (response.statusCode == 200 && response.data != null) {
      final model = UpcomingMovieModel.fromJson(response.data);
      return model.results ?? [];
    } else {
      throw Exception('Failed to load movies');
    }
  }
   Future<List<TvshowMovie>> fetchTvShowsMovies() async {
    final response = await dio.get(Url.tvShow);

    if (response.statusCode == 200 && response.data != null) {
      final model = TvshowMovieModel.fromJson(response.data);
      return model.results ?? [];
    } else {
      throw Exception('Failed to load TV shows');
    }
  }
}

