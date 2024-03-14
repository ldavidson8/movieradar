import 'dart:convert';
import 'dart:developer' as dev;
import 'package:movieradar/data/tmdb_api.dart';
import 'package:http/http.dart' as http;
import 'package:movieradar/models/genre.dart';
import 'package:movieradar/models/movie_cast/movie_cast.dart';
import 'package:movieradar/models/movie_details.dart';
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

  Future<MovieDetails> getMovieDetails(int movieId) async {
    try {
      final response =
          await http.get(Uri.parse(_tmdbApi.movieDetailsUrl(movieId)));
      final data = jsonDecode(response.body);
      return MovieDetails.fromJson(data);
    } catch (e) {
      dev.log('Failed to parse data: $e');
      throw Exception('Failed to parse data');
    }
  }

  Future<MovieCast> getMovieCredits(int movieId) async {
    try {
      final response =
          await http.get(Uri.parse(_tmdbApi.movieCreditsUrl(movieId)));
      final data = jsonDecode(response.body);
      return MovieCast.fromJson(data);
    } catch (e) {
      dev.log('Failed to parse data: $e');
      throw Exception('Failed to parse data');
    }
  }

  Future<List<Genre>> getMovieGenres() async {
    final response = await http.get(Uri.parse(_tmdbApi.movieGenreUrl));
    if (response.statusCode == 200) {
      try {
        final data = jsonDecode(response.body);
        if (data['genres'] != null) {
          return data['genres']
              .map<Genre>((json) => Genre.fromMap(json))
              .toList();
        } else {
          dev.log('Genres field null');
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

  Future<List<MovieModel>> searchForMovies({
    required String query,
    bool? includeAdult,
    String? language,
    int? primaryReleaseYear,
    int? page,
    String? region,
    int? year,
  }) async {
    final url = Uri.parse(_tmdbApi.searchUrl()).replace(queryParameters: {
      if (includeAdult != null) 'include_adult': includeAdult.toString(),
      if (language != null) 'language': language,
      if (primaryReleaseYear != null)
        'primary_release_year': primaryReleaseYear.toString(),
      if (page != null) 'page': page.toString(),
      if (region != null) 'region': region,
      if (year != null) 'year': year.toString(),
    });

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['results'] != null) {
          return data['results']
              .map<MovieModel>((json) => MovieModel.fromMap(json))
              .toList();
        } else {
          throw Exception('Failed to load movies');
        }
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      throw Exception('Failed to load movies: $e');
    }
  }
}
