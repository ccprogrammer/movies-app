import 'package:flutter/material.dart';
import 'package:movies_app/models/search_movie_model.dart';
import 'package:movies_app/services/http_services.dart';

class SearchedMoviesProvider with ChangeNotifier {
  List<SearchMovieModel> _searchedMovies = [];
  bool _isLoading = false;
  bool _isError = false;
  bool _noMovies = false;

  List<SearchMovieModel> get searchedMovies => _searchedMovies;
  bool get isLoading => _isLoading;
  bool get isError => _isError;
  bool get noMovies => _noMovies;

  set searchedMovies(List<SearchMovieModel> _searchedMovies) {
    _searchedMovies = searchedMovies;
    notifyListeners();
  }

  set isLoading(bool _isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  set isError(bool _isError) {
    _isError = isError;
    notifyListeners();
  }

  set noMovies(bool _noMovies) {
    _noMovies = noMovies;
    notifyListeners();
  }

  Future searchMovie(movieName) async {
    _isLoading = true;
    notifyListeners();
    try {
      List<SearchMovieModel> searchedMovies =
          await Http().searchMovie(movieName);

      _searchedMovies = searchedMovies;

      _isError = false;

      if (_searchedMovies.isEmpty) {
        _noMovies = true;
      } else {
        _noMovies = false;
      }

      notifyListeners();
    } catch (error) {
      _isError = true;
      _noMovies = false;
      print(error);

      notifyListeners();
    }
    _isLoading = false;
  }
}
