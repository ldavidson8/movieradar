import 'dart:convert';
import 'dart:developer' as dev;
import 'package:movieradar/data/tmdb_api.dart';
import 'package:http/http.dart' as http;
import 'package:movieradar/models/movie_model.dart';

class TMDBRepository {
  final _tmdbApi = TMDBApi();
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await http.get(Uri.parse(_tmdbApi.popularUrl));
    if (response.statusCode == 200) {
      try {
        final data = jsonDecode(response.body);
        if (data['results'] != null) {
          return data['results']
              .map<MovieModel>((json) => MovieModel.fromMap(json))
              .toList();
        } else {
          dev.log('Results field null');
          return [];
        }
      } catch (e) {
        dev.log('Failed to parse data: $e');
        throw Exception('Failed to parse data');
      }
    } else {
      dev.log('Failed to load data: ${response.statusCode}');
      throw Exception('Failed to load data');
    }
  }

  Future<List<MovieModel>> getTopMovies() async {
    final response = await http.get(Uri.parse(_tmdbApi.popularUrl));
    if (response.statusCode == 200) {
      try {
        final data = jsonDecode(response.body);
        if (data['results'] != null) {
          return data['results']
              .map<MovieModel>((json) => MovieModel.fromMap(json))
              .toList();
        } else {
          dev.log('Results field null');
          return [];
        }
      } catch (e) {
        dev.log('Failed to parse data: $e');
        throw Exception('Failed to parse data');
      }
    } else {
      dev.log('Failed to load data: ${response.statusCode}');
      throw Exception('Failed to load data');
    }
  }

  Future<List<MovieModel>> getNowPlayingMovies() async {
    final url = _tmdbApi.nowPlayingUrl;
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final List<dynamic> movieData = body['results'];
      final List<MovieModel> movies = movieData
          .map<MovieModel>((data) => MovieModel.fromJson(data))
          .toList();
      return movies;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<MovieModel>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_tmdbApi.trendingUrl));
    if (response.statusCode == 200) {
      try {
        final data = jsonDecode(response.body);
        if (data['results'] != null) {
          return data['results']
              .map<MovieModel>((json) => MovieModel.fromMap(json))
              .toList();
        } else {
          dev.log('Results field null');
          return [];
        }
      } catch (e) {
        dev.log('Failed to parse data: $e');
        throw Exception('Failed to parse data');
      }
    } else {
      dev.log('Failed to load data: ${response.statusCode}');
      throw Exception('Failed to load data');
    }
  }

  Future<List<MovieModel>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(_tmdbApi.upcomingUrl));
    if (response.statusCode == 200) {
      try {
        final data = jsonDecode(response.body);
        if (data['results'] != null) {
          return data['results']
              .map<MovieModel>((json) => MovieModel.fromMap(json))
              .toList();
        } else {
          dev.log('Results field null');
          return [];
        }
      } catch (e) {
        dev.log('Failed to parse data: $e');
        throw Exception('Failed to parse data');
      }
    } else {
      dev.log('Failed to load data: ${response.statusCode}');
      throw Exception('Failed to load data');
    }
  }

  Future<MovieModel> getMovieDetails(int movieId) async {
    final url = _tmdbApi.movieDetailsUrl(movieId);
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final MovieModel movie = MovieModel.fromJson(body);
      return movie;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<MovieModel>> getMovieRecommendations(int movieId) async {
    final url = _tmdbApi.movieRecommendationsUrl(movieId);
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final List<dynamic> movieData = body['results'];
      final List<MovieModel> movies = movieData
          .map<MovieModel>((data) => MovieModel.fromJson(data))
          .toList();
      return movies;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<MovieModel>> searchForMovies(String query) async {
    final url = _tmdbApi.searchUrl(query);
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final List<dynamic> movieData = body['results'];
      final List<MovieModel> movies = movieData
          .map<MovieModel>((data) => MovieModel.fromJson(data))
          .toList();
      return movies;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
