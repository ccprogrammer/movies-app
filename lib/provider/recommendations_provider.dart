import 'package:flutter/material.dart';
import 'package:movies_app/models/recommendations_model.dart';
import 'package:movies_app/services/http_services.dart';

class RecommendationsProvider with ChangeNotifier {
  List<RecommendationsModel> _recommendationsMovie = [];
  bool _isLoading = true;

  List<RecommendationsModel> get recommendationsMovie => _recommendationsMovie;
  bool get isLoading => _isLoading;

  set recommendationsMovie(List<RecommendationsModel> _recommendationsMovie) {
    _recommendationsMovie = recommendationsMovie;
    notifyListeners();
  }

  set isLoading(bool _isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  Future getRecommendationsMovie(movieId) async {
    _isLoading = true;

    try {
      List<RecommendationsModel> recommendationsMovie =
          await Http().getRecommendations(movieId);
      _recommendationsMovie = recommendationsMovie;
      _isLoading = false;
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
