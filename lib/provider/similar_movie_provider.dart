import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/services/http_services.dart';

class SimilarMovieProvider with ChangeNotifier {
  List<MovieModel> _similarMovie = [];

  List<MovieModel> get similarMovie => _similarMovie;

  set similarMovie(List<MovieModel> _similarMovie) {
    _similarMovie = similarMovie;
    notifyListeners();
  }

  Future getSimilarMovie(movieId) async {
    similarMovie.clear();
    try {
      List<MovieModel> similarMovie = await Http().getSimilarMovie(movieId);
      _similarMovie = similarMovie;
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
