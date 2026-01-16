import 'package:dio/dio.dart';
import 'package:movie_nest/core/url.dart';
import 'package:movie_nest/model/upcoming_movie.dart';
import 'package:movie_nest/model/upcoming_movie_model.dart';

class UpcomingMovieService {
  final Dio dio = Dio();

  Future<List<UpcomingMovie>> fetchUpcomingMovies() async {
    final response = await dio.get(Url.upcoming);

    if (response.statusCode == 200 && response.data != null) {
      final model = UpcomingMovieModel.fromJson(response.data);
      return model.results ?? [];
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
