import 'package:movie_nest/model/tvshow.dart';

class TvshowMovieModel {
  final int? page;
  final List<Tvshow>? result;
  final int? totalPages;
  final int? totalResults;

  TvshowMovieModel({
    this.page,
    this.result,
    this.totalPages,
    this.totalResults,
  });

  factory TvshowMovieModel.fromJson(Map<String, dynamic> json) {
    return TvshowMovieModel(
      page: json['page'],
      result: (json['results'] as List<dynamic>)
          .map((e) => Tvshow.fromJson(e))
          .toList(),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}
