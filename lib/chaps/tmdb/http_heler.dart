import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:tutorial/chaps/tmdb/movie.dart';

class HttpHelper {
  final String urlKey = '?api_key=73c41ef5662b0a5e5060314f2392ec06';
  final String urlBase = 'https://api.themoviedb.org/3/movie';
  final String urlUpcoming = '/upcoming';
  final String urlLanguage = '&language=en-US';
  final String urlSearchBase =
      'https://api.themoviedb.org/3/search/movie?api_key=73c41ef5662b0a5e5060314f2392ec06&query=';

  Future<List?> getUpcoming() async {
    final String upcoming = urlBase + urlUpcoming + urlKey + urlLanguage;
    //print(upcoming);
    //http connection
    http.Response response = await http.get(Uri.parse(upcoming));

    if (response.statusCode == HttpStatus.ok) {
      final jsonResponse = jsonDecode(response.body);
      final movieMap = jsonResponse['results'];
      List movies = movieMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      return null;
    }
  }

  Future<List?> findMovies(String title) async {
    final String query = urlSearchBase + title;
    http.Response response = await http.get(Uri.parse(query));
    if (response.statusCode == HttpStatus.ok) {
      final jsonResponse = jsonDecode(response.body);
      final movieMap = jsonResponse['results'];
      List movies = movieMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      return null;
    }
  }
}
