import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_detail_model.dart';
import 'package:movies_app/services/http_services.dart';
import 'package:provider/provider.dart';

class NowPlayingProvider with ChangeNotifier {
  List<MovieDetailModel> _nowPlaying = [];

  List<MovieDetailModel> get nowPlaying => _nowPlaying;

  set nowPlaying(List<MovieDetailModel> _nowPlaying) {
    _nowPlaying = _nowPlaying;
    notifyListeners();
  }

  Future getNowPlaying() async {
    try {
      List<MovieDetailModel> nowPlaying = await Http().getNowPlaying();
      _nowPlaying = nowPlaying;
    } catch (error) {
      print(error);
    }
  }
}
