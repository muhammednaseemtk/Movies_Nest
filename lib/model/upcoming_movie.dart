class UpcomingMovie {
  final String? originalTitle;
  final String? overview;
  final String? posterPath;
  final String? releaseDate;
  final String? originalLanguage;
  final double? voteAverage;

  UpcomingMovie({
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.originalLanguage,
    this.voteAverage,
  });

  factory UpcomingMovie.fromJson(Map<String, dynamic> json) {
    return UpcomingMovie(
      originalTitle: json['original_title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      originalLanguage: json['original_language'],
       voteAverage: (json['vote_average'] as num?)?.toDouble(),
    );
  }
}
