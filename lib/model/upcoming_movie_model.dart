import 'upcoming_movie.dart';

class UpcomingMovieModel {
  final int? page;
  final List<UpcomingMovie>? results;
  final int? totalPages;
  final int? totalResults;

  UpcomingMovieModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory UpcomingMovieModel.fromJson(Map<String, dynamic> json) {
    return UpcomingMovieModel(
      page: json['page'],
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => UpcomingMovie.fromJson(e))
          .toList(),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}
