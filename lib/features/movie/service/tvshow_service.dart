import 'package:movie_nest/core/constants/url.dart';
import 'package:movie_nest/core/network/api_client.dart';
import 'package:movie_nest/features/movie/model/tvshow_movie.dart';
import 'package:movie_nest/features/movie/model/tvshow_movie_model.dart';

class TvShowService {
  final ApiClient api = ApiClient();

  Future<List<TvshowMovie>> fetchTvShows() async {
    final response = await api.get(Url.tvShow);

    if (response != null &&
        response.statusCode == 200 &&
        response.data != null) {
      final model = TvshowMovieModel.fromJson(response.data);
      return model.results ?? [];
    }

    return [];
  }
}