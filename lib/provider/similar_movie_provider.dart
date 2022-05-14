import 'package:flutter/material.dart';
import 'package:movies_app/models/similar_model.dart';
import 'package:movies_app/services/http_services.dart';

class SimilarMovieProvider with ChangeNotifier {
  List<SimilarMovieModel> _similarMovie = [];
  bool _isLoading = true;

  List<SimilarMovieModel> get similarMovie => _similarMovie;
  bool get isLoading => _isLoading;

  set similarMovie(List<SimilarMovieModel> _similarMovie) {
    _similarMovie = similarMovie;
    notifyListeners();
  }

  set isLoading(bool _isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  Future getSimilarMovie(movieId) async {
    _isLoading = true;
    try {
      List<SimilarMovieModel> similarMovie =
          await Http().getSimilarMovie(movieId);
      _similarMovie = similarMovie;
      _isLoading = false;
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
