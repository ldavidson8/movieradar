import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'genre.dart';

class MovieDetails extends Equatable {
  final bool? adult;
  final String? backdropPath;
  final int? budget;
  final List<Genre>? genres;
  final String? homepage;
  final int? id;
  final String? imdbId;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? releaseDate;
  final int? revenue;
  final int? runtime;
  final String? status;
  final String? tagline;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  const MovieDetails({
    this.adult,
    this.backdropPath,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory MovieDetails.fromMap(Map<String, dynamic> json) => MovieDetails(
        adult: json['adult'] as bool?,
        backdropPath: 'https://image.tmdb.org/t/p/w500${json['backdrop_path']}',
        budget: json['budget'] as int?,
        genres: (json['genres'] as List<dynamic>?)
            ?.map((e) => Genre.fromMap(e as Map<String, dynamic>))
            .toList(),
        homepage: json['homepage'] as String?,
        id: json['id'] as int?,
        imdbId: json['imdb_id'] as String?,
        originalLanguage: json['original_language'] as String?,
        originalTitle: json['original_title'] as String?,
        overview: json['overview'] as String?,
        popularity: (json['popularity'] as num?)?.toDouble(),
        posterPath: 'https://image.tmdb.org/t/p/w500${json['poster_path']}',
        releaseDate: json['release_date'] as String?,
        revenue: json['revenue'] as int?,
        runtime: json['runtime'] as int?,
        status: json['status'] as String?,
        tagline: json['tagline'] as String?,
        title: json['title'] as String?,
        video: json['video'] as bool?,
        voteAverage: (json['vote_average'] as num?)?.toDouble(),
        voteCount: json['vote_count'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'adult': adult,
        'backdrop_path': backdropPath,
        'budget': budget,
        'genres': genres?.map((e) => e.toMap()).toList(),
        'homepage': homepage,
        'id': id,
        'imdb_id': imdbId,
        'original_language': originalLanguage,
        'original_title': originalTitle,
        'overview': overview,
        'popularity': popularity,
        'poster_path': posterPath,
        'release_date': releaseDate,
        'revenue': revenue,
        'runtime': runtime,
        'status': status,
        'tagline': tagline,
        'title': title,
        'video': video,
        'vote_average': voteAverage,
        'vote_count': voteCount,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MovieDetails].
  factory MovieDetails.fromJson(Map<String, dynamic> data) {
    return MovieDetails.fromMap(data);
  }

  /// `dart:convert`
  ///
  /// Converts [MovieDetails] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      adult,
      backdropPath,
      budget,
      genres,
      homepage,
      id,
      imdbId,
      originalLanguage,
      originalTitle,
      overview,
      popularity,
      posterPath,
      releaseDate,
      revenue,
      runtime,
      status,
      tagline,
      title,
      video,
      voteAverage,
      voteCount,
    ];
  }
}
