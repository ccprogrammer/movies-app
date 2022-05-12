import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/constants.dart';
import 'package:movies_app/models/movie_detail_model.dart';
import 'package:movies_app/models/now_playing_model.dart';

class Http {
  String _baseUrl = Const.baseUrl;
  String _apiKey = Const.apiKey;

  Future<List<NowPlayingModel>> getNowPlaying() async {
    Uri url = Uri.parse('$_baseUrl/now_playing$_apiKey');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['results'];
      List<NowPlayingModel> nowPlaying = [];

      for (var item in data) {
        nowPlaying.add(NowPlayingModel.fromJson(item));
      }

      return nowPlaying;
    } else {
      throw Exception('Error get data');
    }
  }

  Future getMovieDetail(movieId) async {
    Uri url = Uri.parse('$_baseUrl/$movieId$_apiKey');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var movieDetail = jsonDecode(response.body);

      return movieDetail;
    } else {
      throw Exception('Error get data');
    }
  }
}
