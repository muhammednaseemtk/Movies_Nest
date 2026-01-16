class TrendingMovie {
  final String? title;
  final String? overView;
  final String? posterPath;
  final String? movieType;
  final double? voteAverage;

  TrendingMovie({
    this.title,
    this.overView,
    this.posterPath,
    this.movieType,
    this.voteAverage
  });

  factory TrendingMovie.fromJson(Map<String,dynamic>json) {
    return TrendingMovie(
      title: json['title'],
      overView: json['overview'],
      posterPath: json['poster_path'],
      movieType: json['media_type'],
      voteAverage: (json['vote_average']as num).toDouble()
    );
  }
}