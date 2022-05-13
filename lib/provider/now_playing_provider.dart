import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/models/now_playing_model.dart';
import 'package:movies_app/services/http_services.dart';

class NowPlayingProvider with ChangeNotifier {
  List<NowPlayingModel> _nowPlaying = [];

  List<NowPlayingModel> get nowPlaying => _nowPlaying;

  set nowPlaying(List<NowPlayingModel> _nowPlaying) {
    _nowPlaying = nowPlaying;
    notifyListeners();
  }

  Future getNowPlaying() async {
    try {
      List<NowPlayingModel> nowPlaying = await Http().getNowPlaying();
      _nowPlaying = nowPlaying;
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
