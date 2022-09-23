import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/services/http_services.dart';

class MovieDetailProvider with ChangeNotifier {
  MovieModel _movieDetail = MovieModel();
  bool _isLoading = true;

// getter
  MovieModel get movieDetail => _movieDetail;
  bool get isLoading => _isLoading;

  Future getMovieDetail({movieId}) async {
    _isLoading = true;
    try {
      var movieJson = await Http().getMovieDetail(movieId);
      MovieModel movieDetail = MovieModel.fromJson(movieJson);
      _movieDetail = movieDetail;
      _isLoading = false;
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
