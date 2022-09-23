import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/services/http_services.dart';

class FavoriteProvider with ChangeNotifier {
  List<MovieModel> _favoriteId = [];
  List<MovieModel> _favorite = [];
  bool _isLoading = false;

  List<MovieModel> get favoriteId => _favoriteId;
  List<MovieModel> get favorite => _favorite;
  bool get isLoading => _isLoading;

// initiate after implementing shared preferences
  Future setFavoriteList() async {
    _isLoading = true;

    for (var item in _favoriteId) {
      addFavoriteList(movie: await item);
    }
    _isLoading = false;
  }

  Future addFavoriteList({movie}) async {
    try {
      var movieJson = await Http().getMovieDetail(movie.id);
      MovieModel movieDetail = MovieModel.fromJson(movieJson);
      _favorite.add(movieDetail);

      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  setFavorite(MovieModel movie) {
    if (!isFavorite(movie)) {
      _favoriteId.add(movie);
      addFavoriteList(movie: movie);
    } else {
      _favoriteId.removeWhere((element) => element.id == movie.id);
      _favorite.removeWhere((element) => element.id == movie.id);
    }

    notifyListeners();
  }

  isFavorite(MovieModel movie) {
    // -1 it means element not found
    if (_favoriteId.indexWhere((element) => element.id == movie.id) == -1) {
      return false;
    } else {
      return true;
    }
  }
}
