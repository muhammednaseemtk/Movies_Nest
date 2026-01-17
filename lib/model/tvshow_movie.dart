class TvshowMovie {
  final String? originalName;
  final String? posterPath;
  final String? firstAirDate;
  final double? voteAverage;
  final double? popularity;

  TvshowMovie({
    this.originalName,
    this.posterPath,
    this.firstAirDate,
    this.voteAverage,
    this.popularity
  });
  
  factory TvshowMovie.fromJson(Map<String,dynamic>json) {
    return TvshowMovie(
      originalName: json['name'],
      posterPath: json['poster_path'],
      firstAirDate: json['first_air_date'],
      voteAverage: (json['vote_average']as num).toDouble(),
      popularity: (json['popularity']as num).toDouble()
    );
  }
}