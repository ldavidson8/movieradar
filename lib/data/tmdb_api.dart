import 'package:movieradar/constants.dart';

class TMDBApi {
  static final TMDBApi _instance = TMDBApi._internal();

  factory TMDBApi() {
    return _instance;
  }

  TMDBApi._internal() {
    _baseUrl = Constants.TMDB_BASE_URL;
  }

  late final String _baseUrl;
  static String? apiKey = Constants.TMDB_API_KEY;

  String get popularUrl => '$_baseUrl/movie/popular?api_key=$apiKey';
  String get topRatedUrl => '$_baseUrl/movie/top_rated?api_key=$apiKey&page=1';
  String get nowPlayingUrl =>
      '$_baseUrl/movie/now_playing?api_key=$apiKey&page=1';
  String get trendingUrl => '$_baseUrl/trending/all/week?api_key=$apiKey';
  String get upcomingUrl => '$_baseUrl/movie/upcoming?api_key=$apiKey&page=1';
  String movieDetailsUrl(int movieId) =>
      '$_baseUrl/movie/$movieId?api_key=$apiKey';
  String movieRecommendationsUrl(int movieId) =>
      '$_baseUrl/movie/$movieId/recommendations?api_key=$apiKey&page=1';
  String searchUrl(String query) =>
      '$_baseUrl/search/movie?api_key=$apiKey&query=$query&page=1';
}
