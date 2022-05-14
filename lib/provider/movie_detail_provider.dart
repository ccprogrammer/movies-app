import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/services/http_services.dart';

class MovieDetailProvider with ChangeNotifier {
  MovieModel _movieDetail = MovieModel();
  bool _isLoading = true;

  MovieModel get movieDetail => _movieDetail;
  bool get isLoading => _isLoading;

  set movieDetail(MovieModel _movieDetail) {
    _movieDetail = movieDetail;
    notifyListeners();
  }

  set isLoading(bool _isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

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
