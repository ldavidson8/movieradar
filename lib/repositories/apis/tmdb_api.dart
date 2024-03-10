import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movieradar/constants.dart';

class TMDBApi {
  TMDBApi._internal();

  // Define a singleton instance for the TMDBApi
  factory TMDBApi() => instance;
  static final TMDBApi instance = TMDBApi._internal();

  static const _apiBaseUrl = TMDB_BASE_URL;
  static const _apiKey = TMDB_API_KEY;
  final http.Client _httpClient = http.Client();

  // Defines a default get method that always passes in the api key using .replace
  Future<dynamic> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    Uri uri = Uri.parse('$_apiBaseUrl/$endpoint');
    if (queryParameters != null) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    uri = uri.replace(queryParameters: {'api_key': _apiKey});

    final response = await _httpClient.get(uri);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data from TMDB API');
    }
  }
}
