// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class Constants {
  static final TMDB_API_KEY = dotenv.env['TMDB_API_KEY'];

  static final BEARER_TOKEN = dotenv.env['BEARER_TOKEN'];

  static const TMDB_BASE_URL = 'https://api.themoviedb.org/3';
}
