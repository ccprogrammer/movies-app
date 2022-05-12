import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/constants.dart';
import 'package:movies_app/models/movie_model.dart';

class Http {
  String _baseUrl = Const.baseUrl;
  String _apiKey = Const.apiKey;

  Future<List<MovieModel>> getNowPlaying() async {
    Uri url = Uri.parse('$_baseUrl/now_playing$_apiKey');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['results'];
      List<MovieModel> movies = [];

      for (var item in data) {
        movies.add(MovieModel.fromJson(item));
      }

      return movies;
    } else {
      throw Exception('Error get data');
    }
  }
}
