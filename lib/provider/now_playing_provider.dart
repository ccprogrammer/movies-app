import 'package:flutter/material.dart';
import 'package:movies_app/models/home_movie_model.dart';
import 'package:movies_app/services/http_services.dart';

class NowPlayingProvider with ChangeNotifier {
  List<HomeMovieModel> _nowPlaying = [];
  bool _isLoading = true;

  List<HomeMovieModel> get nowPlaying => _nowPlaying;
  bool get isLoading => _isLoading;

  Future getNowPlaying() async {
    _isLoading = true;
    try {
      List<HomeMovieModel> nowPlaying = await Http().getNowPlaying();
      _nowPlaying.clear();
      _nowPlaying = nowPlaying;
      _isLoading = false;

      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
