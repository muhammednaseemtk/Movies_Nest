class Url {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';

  static const String apiKey = 'b31b50e8a5a56c93508737f8bfca2522';

  static const String trending =
      '$baseUrl/trending/movie/day?api_key=$apiKey';

  static const String upcoming =
      '$baseUrl/movie/upcoming?api_key=$apiKey';

  static const String tvShow =
      '$baseUrl/tv/airing_today?api_key=$apiKey';
}
