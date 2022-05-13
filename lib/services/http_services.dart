import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/constants.dart';
import 'package:movies_app/models/movie_model.dart';

class Http {
  String _baseUrl = Const.baseUrl;
  String _apiKey = Const.apiKey;

  Future getNowPlaying() async {
    Uri url = Uri.parse('$_baseUrl/now_playing$_apiKey');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<MovieModel> nowPlaying = [];

      for (var item in data) {
        nowPlaying.add(MovieModel.fromJson(await getMovieDetail(item['id'])));
      }

      return nowPlaying;
    } else {
      throw Exception('Error get data');
    }
  }

  Future getSimilarMovie(movieId) async {
    Uri url = Uri.parse('$_baseUrl/$movieId/similar$_apiKey');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<MovieModel> similarMovie = [];

      for (var item in data) {
        similarMovie.add(MovieModel.fromJson(await getMovieDetail(item['id'])));
      }

      return similarMovie;
    } else {
      throw Exception('Error get data');
    }
  }

  Future getMovieDetail(movieId) async {
    Uri url = Uri.parse('$_baseUrl/$movieId$_apiKey');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> movieDetail = jsonDecode(response.body);

      return movieDetail;
    } else {
      throw Exception('Error get data');
    }
  }
}
