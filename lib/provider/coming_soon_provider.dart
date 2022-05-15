import 'package:flutter/material.dart';
import 'package:movies_app/models/home_movie_model.dart';
import 'package:movies_app/services/http_services.dart';

class ComingSoonProvider with ChangeNotifier {
  List<HomeMovieModel> _comingSoon = [];
  bool _isLoading = true;

  List<HomeMovieModel> get comingSoon => _comingSoon;
  bool get isLoading => _isLoading;

  set comingSoon(List<HomeMovieModel> _comingSoon) {
    _comingSoon = comingSoon;
    notifyListeners();
  }

  set isLoading(bool _isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  Future getComingSoon() async {
    _isLoading = true;
    try {
      List<HomeMovieModel> comingSoon = await Http().getComingSoon();
      _comingSoon = comingSoon;
      _isLoading = false;

      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
