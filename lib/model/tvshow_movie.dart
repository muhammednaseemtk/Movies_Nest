class TvshowMovie {
  final String? originalName;
  final String? posterPath;
  final String? firstAirDate;

  TvshowMovie({
    this.originalName,
    this.posterPath,
    this.firstAirDate
  });
  
  factory TvshowMovie.fromJson(Map<String,dynamic>json) {
    return TvshowMovie(
      originalName: json['original_name'],
      posterPath: json['poster_path'],
      firstAirDate: json['first_air_date']
    );
  }
}