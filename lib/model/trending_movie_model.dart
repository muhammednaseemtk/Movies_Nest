import 'package:movie_nest/model/trending_movie.dart';

class TrendingMovieModel {
  final int? page;
  final List<TrendingMovie>? result;
  final int? totalPages;
  final int? totalResult;

  TrendingMovieModel({
    this.page,
    this.result,
    this.totalPages,
    this.totalResult,
  });

  factory TrendingMovieModel.fromJson(Map<String, dynamic> json) {
    return TrendingMovieModel(
      page: json['page'],
      result: (json['results'] as List<dynamic>)
          .map((e) => TrendingMovie.fromJson(e))
          .toList(),
      totalPages: json['total_pages'],
      totalResult: json['total_results'],
    );
  }
}
