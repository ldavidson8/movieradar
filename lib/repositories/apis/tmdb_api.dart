import 'package:http/http.dart';
import 'package:movieradar/constants.dart';

class TMDBApi {
  const TMDBApi(this._client);
  final Client _client;

  static const _apiBaseUrl = tmdbBaseUrl;

  Future<Response> get(String path) async {
    return _client.get(Uri.parse('$_apiBaseUrl$path'));
  }
}
