import 'dart:convert';

import 'package:equatable/equatable.dart';

class Cast extends Equatable {
  final bool? adult;
  final int? gender;
  final int? id;
  final String? knownForDepartment;
  final String? name;
  final String? originalName;
  final double? popularity;
  final String? profilePath;
  final int? castId;
  final String? character;
  final String? creditId;
  final int? order;

  const Cast({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
  });

  factory Cast.fromMap(Map<String, dynamic> json) => Cast(
        adult: json['adult'] as bool?,
        gender: json['gender'] as int?,
        id: json['id'] as int?,
        knownForDepartment: json['known_for_department'] as String?,
        name: json['name'] as String?,
        originalName: json['original_name'] as String?,
        popularity: (json['popularity'] as num?)?.toDouble(),
        profilePath: 'https://image.tmdb.org/t/p/w500${json['profile_path']}',
        castId: json['cast_id'] as int?,
        character: json['character'] as String?,
        creditId: json['credit_id'] as String?,
        order: json['order'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'adult': adult,
        'gender': gender,
        'id': id,
        'known_for_department': knownForDepartment,
        'name': name,
        'original_name': originalName,
        'popularity': popularity,
        'profile_path': profilePath,
        'cast_id': castId,
        'character': character,
        'credit_id': creditId,
        'order': order,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Cast].
  factory Cast.fromJson(String data) {
    return Cast.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Cast] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      adult,
      gender,
      id,
      knownForDepartment,
      name,
      originalName,
      popularity,
      profilePath,
      castId,
      character,
      creditId,
      order,
    ];
  }
}
