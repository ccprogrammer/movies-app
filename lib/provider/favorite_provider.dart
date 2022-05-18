import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_model.dart';

class FavoriteProvider with ChangeNotifier {
  List<MovieModel> _favorite = [];

  List<MovieModel> get favorite => _favorite;

  set favorite(List<MovieModel> favorite) {
    _favorite = favorite;
    notifyListeners();
  }

  setFavorite(MovieModel movie) {
    if (!isfavorite(movie)) {
      _favorite.add(movie);
    } else {
      _favorite.removeWhere((element) => element.id == movie.id);
    }

    notifyListeners();
  }

  isfavorite(MovieModel movie) {
    // -1 it means element not found
    if (_favorite.indexWhere((element) => element.id == movie.id) == -1) {
      return false;
    } else {
      return true;
    }
  }
}
