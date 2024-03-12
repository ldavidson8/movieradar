import 'dart:convert';
import 'dart:developer' as dev;
import 'package:http/http.dart' as http;
import 'package:movieradar/constants.dart';
import 'package:movieradar/models/movie.dart';

class TMDBApi {
  TMDBApi._internal();

  // Define a singleton instance for the TMDBApi
  factory TMDBApi() => _instance;
  static final TMDBApi _instance = TMDBApi._internal();

  static const _apiBaseUrl = Constants.TMDB_BASE_URL;
  static final _bearerToken = Constants.BEARER_TOKEN;
  final http.Client _httpClient = http.Client();

  // Defines a default get method that passes in query params using .replace
  Future<dynamic> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    Uri uri = Uri.parse('$_apiBaseUrl/$endpoint');
    if (queryParameters != null) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    // Add bearer token to authorization headers for every request
    final headers = <String, String>{
      'Authorization': 'Bearer $_bearerToken',
    };

    dev.log('URI: $uri');
    dev.log('Headers: $headers');

    final response = await _httpClient.get(uri, headers: headers);

    dev.log('Response status code: ${response.statusCode}');

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return Future.error('Request failed with status: ${response.statusCode}');
    }
  }

  Future<List<MovieModel>> getTrendingMovies() async {
    final Map<String, dynamic> data = await get('/movie/popular');

    if (data.containsKey('results')) {
      final List<dynamic> results = data['results'];
      return results.map((data) => MovieModel.fromJson(data)).toList();
    } else {
      return Future.error('Request failed with status: ${data['status_code']}');
    }
  }
}
