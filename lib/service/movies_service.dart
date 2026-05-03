import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_nest/core/url.dart';
import 'package:movie_nest/model/trending_movie.dart';
import 'package:movie_nest/model/trending_movie_model.dart';
import 'package:movie_nest/model/tvshow_movie.dart';
import 'package:movie_nest/model/tvshow_movie_model.dart';
import 'package:movie_nest/model/upcoming_movie.dart';
import 'package:movie_nest/model/upcoming_movie_model.dart';

class MovieService {
  late final Dio dio;

  MovieService() {
    dio = Dio(
      BaseOptions(
        baseUrl: Url.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );

    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(requestBody: true, responseBody: true),
      );
    }
  }

  Future<Response> get(String url) async {
    try {
      final response = await dio.get(url);
      return response;
    } on DioException catch (e) {
      debugPrint("Dio Error: ${e.message}");
      throw Exception(e.message);
    } catch (e) {
      debugPrint("Unknown Error: $e");
      throw Exception("Something went wrong");
    }
  }

  Future<List<TrendingMovie>> fetchTrendingMovies() async {
    final response = await get(Url.trending);

    if (response.statusCode == 200 && response.data != null) {
      final model = TrendingMovieModel.fromJson(response.data);
      return model.results ?? [];
    }

    throw Exception('Failed to load trending movies');
  }

  Future<List<UpcomingMovie>> fetchUpcomingMovies() async {
    final response = await get(Url.upcoming);

    if (response.statusCode == 200 && response.data != null) {
      final model = UpcomingMovieModel.fromJson(response.data);
      return model.results ?? [];
    }

    throw Exception('Failed to load upcoming movies');
  }

  Future<List<TvshowMovie>> fetchTvShowsMovies() async {
    final response = await get(Url.tvShow);

    if (response.statusCode == 200 && response.data != null) {
      final model = TvshowMovieModel.fromJson(response.data);
      return model.results ?? [];
    }

    throw Exception('Failed to load TV shows');
  }
}
