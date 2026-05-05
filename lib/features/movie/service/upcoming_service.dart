import 'package:movie_nest/core/constants/url.dart';
import 'package:movie_nest/core/network/api_client.dart';
import 'package:movie_nest/features/movie/model/upcoming_movie.dart';
import 'package:movie_nest/features/movie/model/upcoming_movie_model.dart';

class UpcomingService {
  final ApiClient api = ApiClient();

  Future<List<UpcomingMovie>> fetchUpcomingMovies() async {
    final response = await api.get(Url.upcoming);

    if (response != null &&
        response.statusCode == 200 &&
        response.data != null) {
      final model = UpcomingMovieModel.fromJson(response.data);
      return model.results ?? [];
    }

    return [];
  }
}