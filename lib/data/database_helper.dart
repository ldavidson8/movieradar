import 'package:movieradar/models/genre.dart';
import 'package:sqflite/sqflite.dart';
import 'package:movieradar/models/movie_details.dart';

class DatabaseHelper {
  static const _databaseName = "MovieDB.db";
  static const _databaseVersion = 1;

  DatabaseHelper._();

  static final DatabaseHelper instance = DatabaseHelper._();

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = "$dbPath/$_databaseName";

    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE favourites (
      id INTEGER PRIMARY KEY,
      title TEXT,
      posterPath TEXT,
      overview TEXT,
      voteAverage INTEGER
    )
    ''');

    await db.execute('''
    CREATE TABLE genres (
      id INTEGER,
      genreId INTEGER,
      PRIMARY KEY (id, genreId),
      FOREIGN KEY (id) REFERENCES favourites(id)
    )
    ''');
  }

  Future<void> addFavouriteMovie(MovieDetails movie) async {
    final db = await instance.database;
    final movieId = await db.insert(
      'favourites',
      {
        'id': movie.id,
        'title': movie.title,
        'posterPath': movie.posterPath,
        'overview': movie.overview,
        'voteAverage': movie.voteAverage
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    if (movie.genres != null) {
      for (final genre in movie.genres!) {
        await db.insert(
          'genres',
          {
            'id': movieId,
            'genreId': genre.id,
          },
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
    }
  }

  Future<List<MovieDetails>> getFavouriteMovies() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('favourites');
    if (maps.isEmpty) {
      return [];
    }

    final movieDetailsFutures = maps.map((map) async {
      final movieId = map['id'];
      final genreMaps = await db.query(
        'genres',
        where: 'id = ?',
        whereArgs: [movieId],
      );

      final genres =
          genreMaps.map((map) => Genre(id: map['genreId'] as int?)).toList();

      return MovieDetails(
        id: map['id'],
        title: map['title'],
        posterPath: map['posterPath'],
        overview: map['overview'],
        voteAverage: map['voteAverage'],
        genres: genres,
      );
    }).toList();

    return Future.wait(movieDetailsFutures);
  }

  Future<bool> isFavoriteMovie(int movieId) async {
    final db = await instance.database;
    final count = await db.rawQuery(
      'SELECT COUNT(*) FROM favourites WHERE id = ?',
      [movieId],
    );
    return Sqflite.firstIntValue(count) == 1;
  }

  Future<void> removeFavouriteMovie(int movieId) async {
    final db = await instance.database;
    await db.delete(
      'favourites',
      where: 'id = ?',
      whereArgs: [movieId],
    );
    await db.delete(
      'genres',
      where: 'id = ?',
      whereArgs: [movieId],
    );
  }
}
