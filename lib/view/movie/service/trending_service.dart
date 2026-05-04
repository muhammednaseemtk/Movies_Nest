import 'package:movie_nest/core/constants/url.dart';
import 'package:movie_nest/core/network/api_client.dart';
import 'package:movie_nest/view/movie/model/trending_movie.dart';
import 'package:movie_nest/view/movie/model/trending_movie_model.dart';

class TrendingService {
  final ApiClient api = ApiClient();

  Future<List<TrendingMovie>> fetchTrendingMovies() async {
    final response = await api.get(Url.trending);

    if (response != null &&
        response.statusCode == 200 &&
        response.data != null) {
      final model = TrendingMovieModel.fromJson(response.data);
      return model.results ?? [];
    }

    return [];
  }
}