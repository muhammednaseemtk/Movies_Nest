class OnboardModel {
  final String posterPath;

  OnboardModel({required this.posterPath,});

  factory OnboardModel.fromJson(Map<String, dynamic> json) {
    return OnboardModel(
      posterPath: json['poster_path'] ?? '',
      
    );
  }
}
