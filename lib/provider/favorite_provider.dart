import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_model.dart';

class FavoriteProvider with ChangeNotifier {
  List<MovieModel> _favorite = [];
  List<MovieModel> _favoriteId = [];

  List<MovieModel> get favoriteId => _favoriteId;
  List<MovieModel> get favorite => _favorite;

  set favoriteId(List<MovieModel> favoriteId) {
    _favoriteId = favoriteId;
    notifyListeners();
  }

  set favorite(List<MovieModel> favorite) {
    _favorite = favorite;
    notifyListeners();
  }

  setFavorite(MovieModel movie) {
    if (!isFavorite(movie)) {
      _favoriteId.add(movie);
    } else {
      _favoriteId.removeWhere((element) => element.id == movie.id);
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
