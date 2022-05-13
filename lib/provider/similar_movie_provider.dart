import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/models/similar_model.dart';
import 'package:movies_app/services/http_services.dart';

class SimilarMovieProvider with ChangeNotifier {
  List<SimilarMovieModel> _similarMovie = [];

  List<SimilarMovieModel> get similarMovie => _similarMovie;

  set similarMovie(List<SimilarMovieModel> _similarMovie) {
    _similarMovie = similarMovie;
    notifyListeners();
  }

  Future getSimilarMovie(movieId) async {
    try {
      List<SimilarMovieModel> similarMovie = await Http().getSimilarMovie(movieId);
      _similarMovie = similarMovie;
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
