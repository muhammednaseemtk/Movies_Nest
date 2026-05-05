class OnboardModel {
  final String posterPath;
  final String title;

  OnboardModel({required this.posterPath, required this.title});

  factory OnboardModel.fromJson(Map<String, dynamic> json) {
    return OnboardModel(
      posterPath: json['poster_path'] ?? '',
      title: json['title'] ?? '',
    );
  }
}
