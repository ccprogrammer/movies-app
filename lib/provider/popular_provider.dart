import 'package:flutter/material.dart';
import 'package:movies_app/models/home_movie_model.dart';
import 'package:movies_app/services/http_services.dart';

class PopularProvider with ChangeNotifier {
  List<HomeMovieModel> _popular = [];
  bool _isLoading = true;

  List<HomeMovieModel> get popular => _popular;
  bool get isLoading => _isLoading;

  set popular(List<HomeMovieModel> _popular) {
    _popular = popular;
    notifyListeners();
  }

  set isLoading(bool _isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  Future getPopular() async {
    _isLoading = true;
    try {
      List<HomeMovieModel> popular = await Http().getPopular();
      _popular.clear();
      _popular = popular;
      _isLoading = false;

      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
