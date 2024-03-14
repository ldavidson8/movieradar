import 'dart:convert';

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
    final path = await getDatabasesPath();
    final dbPath = "$path/$_databaseName";

    return await openDatabase(
      dbPath,
      version: _databaseVersion,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE favourites (
      tmdbId INTEGER PRIMARY KEY,
      title TEXT,
      overview TEXT,
      runtime INTEGER
    )
  ''');
  }

  Future<List<MovieDetails>> getFavouriteMovies() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('favourites');

    return List.generate(maps.length, (i) {
      return MovieDetails.fromMap(maps[i]);
    });
  }

  Future<void> addFavouriteMovie(MovieDetails movie) async {
    final db = await database;

    await db.insert(
      'favourites',
      movie.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
