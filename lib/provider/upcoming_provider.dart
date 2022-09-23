import 'package:flutter/material.dart';
import 'package:movies_app/models/home_movie_model.dart';
import 'package:movies_app/services/http_services.dart';

class UpcomingProvider with ChangeNotifier {
  List<HomeMovieModel> _upcoming = [];
  bool _isLoading = true;

  List<HomeMovieModel> get upcoming => _upcoming;
  bool get isLoading => _isLoading;

  Future getUpcoming() async {
    _isLoading = true;
    try {
      List<HomeMovieModel> upcoming = await Http().getUpcoming();
      _upcoming.clear();
      _upcoming = upcoming;
      _isLoading = false;

      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
