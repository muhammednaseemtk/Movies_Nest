class Tvshow {
  final String? originalName;
  final String? posterPath;
  final String? firstAirDate;

  Tvshow({
    this.originalName,
    this.posterPath,
    this.firstAirDate
  });
  
  factory Tvshow.fromJson(Map<String,dynamic>json) {
    return Tvshow(
      originalName: json['original_name'],
      posterPath: json['poster_path'],
      firstAirDate: json['first_air_date']
    );
  }
}