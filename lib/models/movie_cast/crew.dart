import 'dart:convert';

import 'package:equatable/equatable.dart';

class Crew extends Equatable {
  final bool? adult;
  final int? gender;
  final int? id;
  final String? knownForDepartment;
  final String? name;
  final String? originalName;
  final double? popularity;
  final String? profilePath;
  final String? creditId;
  final String? department;
  final String? job;

  const Crew({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.creditId,
    this.department,
    this.job,
  });

  factory Crew.fromMap(Map<String, dynamic> json) => Crew(
        adult: json['adult'] as bool?,
        gender: json['gender'] as int?,
        id: json['id'] as int?,
        knownForDepartment: json['known_for_department'] as String?,
        name: json['name'] as String?,
        originalName: json['original_name'] as String?,
        popularity: (json['popularity'] as num?)?.toDouble(),
        profilePath: 'https://image.tmdb.org/t/p/w500${json['profile_path']}',
        creditId: json['credit_id'] as String?,
        department: json['department'] as String?,
        job: json['job'] as String?,
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
        'credit_id': creditId,
        'department': department,
        'job': job,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Crew].
  factory Crew.fromJson(String data) {
    return Crew.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Crew] to a JSON string.
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
      creditId,
      department,
      job,
    ];
  }
}
