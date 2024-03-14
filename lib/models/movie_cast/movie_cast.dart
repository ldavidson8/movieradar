import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'cast.dart';
import 'crew.dart';

class MovieCast extends Equatable {
  final int? id;
  final List<Cast>? cast;
  final List<Crew>? crew;

  const MovieCast({this.id, this.cast, this.crew});

  factory MovieCast.fromMap(Map<String, dynamic> data) => MovieCast(
        id: data['id'] as int?,
        cast: (data['cast'] as List<dynamic>?)
            ?.map((e) => Cast.fromMap(e as Map<String, dynamic>))
            .toList(),
        crew: (data['crew'] as List<dynamic>?)
            ?.map((e) => Crew.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'cast': cast?.map((e) => e.toMap()).toList(),
        'crew': crew?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MovieCast].
  factory MovieCast.fromJson(Map<String, dynamic> data) {
    return MovieCast.fromMap(data);
  }

  /// `dart:convert`
  ///
  /// Converts [MovieCast] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, cast, crew];
}
