import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/models/now_playing_model.dart';
import 'package:movies_app/services/http_services.dart';

class NowPlayingProvider with ChangeNotifier {
  List<NowPlayingModel> _nowPlaying = [];
  bool _isLoading = true;

  List<NowPlayingModel> get nowPlaying => _nowPlaying;
  bool get isLoading => _isLoading;

  set nowPlaying(List<NowPlayingModel> _nowPlaying) {
    _nowPlaying = nowPlaying;
    notifyListeners();
  }

  set isLoading(bool _isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  Future getNowPlaying() async {
    _isLoading = true;
    try {
      List<NowPlayingModel> nowPlaying = await Http().getNowPlaying();
      _nowPlaying = nowPlaying;
      _isLoading = false;

      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
