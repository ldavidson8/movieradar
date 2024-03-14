import 'package:movieradar/models/genre.dart';

List<String?> getGenreNames(List<int>? genreIds, List<Genre> genres) {
  if (genreIds == null) return [];

  return genreIds
      .map((id) => genres.firstWhere((genre) => genre.id == id,
          orElse: () => Genre(id: -1, name: '')))
      .map((genre) => genre.name)
      .toList();
}
