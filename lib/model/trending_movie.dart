class TrendingMovie {
  final int? id;
  final String? title;
  final String? overView;
  final String? posterPath;
  final String? releaseDates;
  final double? voteAverage;

  TrendingMovie({
    this.id,
    this.title,
    this.overView,
    this.posterPath,
    this.releaseDates,
    this.voteAverage
  });

  factory TrendingMovie.fromJson(Map<String,dynamic>json) {
    return TrendingMovie(
      id: json['id'],
      title: json['title'],
      overView: json['overview'],
      posterPath: json['poster_path'],
      releaseDates: json['release_date'],
      voteAverage: (json['vote_average']as num).toDouble()
    );
  }
}