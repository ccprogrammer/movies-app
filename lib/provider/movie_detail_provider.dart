import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/services/http_services.dart';

class MovieDetailProvider with ChangeNotifier {
  MovieModel _movieDetail = MovieModel();

  MovieModel get movieDetail => _movieDetail;

  set movieDetail(MovieModel _movieDetail) {
    _movieDetail = movieDetail;
    notifyListeners();
  }

  Future getMovieDetail({movieId}) async {
    try {
      var movieJson = await Http().getMovieDetail(movieId);
      MovieModel movieDetail = MovieModel.fromJson(movieJson);

      _movieDetail = movieDetail;
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
