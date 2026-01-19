class TvshowMovie {
  final int? id;
  final String? originalName;
  final String? posterPath;
  final String? firstAirDate;
  final double? voteAverage;
  final String? overView;

  TvshowMovie({
    this.id,
    this.originalName,
    this.posterPath,
    this.firstAirDate,
    this.voteAverage,
    this.overView
  });
  
  factory TvshowMovie.fromJson(Map<String,dynamic>json) {
    return TvshowMovie(
      id: json['id'],
      originalName: json['name'],
      posterPath: json['poster_path'],
      firstAirDate: json['first_air_date'],
      voteAverage: (json['vote_average']as num).toDouble(),
      overView: json['overview']
    );
  }
}