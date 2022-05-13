import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/services/http_services.dart';

class NowPlayingProvider with ChangeNotifier {
  List<MovieModel> _nowPlaying = [];

  List<MovieModel> get nowPlaying => _nowPlaying;

  set nowPlaying(List<MovieModel> _nowPlaying) {
    _nowPlaying = nowPlaying;
    notifyListeners();
  }

  Future getNowPlaying() async {
    try {
      List<MovieModel> nowPlaying = await Http().getNowPlaying();
      _nowPlaying = nowPlaying;
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
