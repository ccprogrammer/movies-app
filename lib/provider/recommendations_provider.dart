import 'package:flutter/material.dart';
import 'package:movies_app/models/recommendations_model.dart';
import 'package:movies_app/services/http_services.dart';

class RecommendationsProvider with ChangeNotifier {
  List<RecommendationsModel> _recommendationsMovie = [];

  List<RecommendationsModel> get recommendationsMovie => _recommendationsMovie;

  set recommendationsMovie(List<RecommendationsModel> _recommendationsMovie) {
    _recommendationsMovie = recommendationsMovie;
    notifyListeners();
  }

  Future getRecommendationsMovie(movieId) async {
    recommendationsMovie.clear();
    try {
      List<RecommendationsModel> recommendationsMovie = await Http().getRecommendations(movieId);
      _recommendationsMovie = recommendationsMovie;
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
