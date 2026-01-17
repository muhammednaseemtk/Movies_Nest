import 'package:movie_nest/model/trending_movie.dart';

class TrendingMovieModel {
  final int? page;
  final List<TrendingMovie>? results;
  final int? totalPages;
  final int? totalResult;

  TrendingMovieModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResult,
  });

  factory TrendingMovieModel.fromJson(Map<String, dynamic> json) {
    return TrendingMovieModel(
      page: json['page'],
      results: (json['results'] as List<dynamic>)
          .map((e) => TrendingMovie.fromJson(e))
          .toList(),
      totalPages: json['total_pages'],
      totalResult: json['total_results'],
    );
  }
}
