import 'package:dio/dio.dart';
import 'package:movie_nest/core/constants/url.dart';
import '../model/onboard_model.dart';

class OnboardService {
  final Dio dio = Dio();

  Future<List<OnboardModel>> fetchPopularMovies() async {
    try {
      final response = await dio.get(Url.popular);

      if (response.statusCode == 200) {
        final List results = response.data['results'];

        return results
            .map((e) => OnboardModel.fromJson(e))
            .toList();
      } else {
        throw Exception('Failed to load movies');
      }
    } on DioException catch (e) {
      throw Exception('Dio Error: ${e.message}');
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}