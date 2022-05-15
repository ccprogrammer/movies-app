import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/constants.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/models/home_movie_model.dart';
import 'package:movies_app/models/recommendations_model.dart';
import 'package:movies_app/models/reviews_model.dart';
import 'package:movies_app/models/similar_model.dart';

class Http {
  String _baseUrl = Const.baseUrl;
  String _apiKey = Const.apiKey;

  Future getNowPlaying() async {
    Uri url = Uri.parse('$_baseUrl/now_playing$_apiKey');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<HomeMovieModel> nowPlaying = [];

      for (var item in data) {
        nowPlaying.add(HomeMovieModel.fromJson(item));
      }

      return nowPlaying;
    } else {
      throw Exception('Error get data');
    }
  }

  Future getComingSoon() async {
    Uri url = Uri.parse('$_baseUrl/upcoming$_apiKey');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<HomeMovieModel> comingSoon = [];

      for (var item in data) {
        comingSoon.add(HomeMovieModel.fromJson(item));
      }

      return comingSoon;
    } else {
      throw Exception('Error get data');
    }
  }

  Future getPopular() async {
    Uri url = Uri.parse('$_baseUrl/popular$_apiKey');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<HomeMovieModel> popular = [];

      for (var item in data) {
        popular.add(HomeMovieModel.fromJson(item));
      }

      return popular;
    } else {
      throw Exception('Error get data');
    }
  }

  Future getSimilarMovie(movieId) async {
    Uri url = Uri.parse('$_baseUrl/$movieId/similar$_apiKey');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<SimilarMovieModel> similarMovie = [];

      for (var item in data) {
        similarMovie.add(SimilarMovieModel.fromJson(item));
      }

      return similarMovie;
    } else {
      throw Exception('Error get data');
    }
  }

  Future getRecommendations(movieId) async {
    Uri url = Uri.parse('$_baseUrl/${movieId}/recommendations$_apiKey');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<RecommendationsModel> recommendationsMovie = [];

      for (var item in data) {
        recommendationsMovie.add(RecommendationsModel.fromJson(item));
      }

      return recommendationsMovie;
    } else {
      throw Exception('Error get data');
    }
  }

  Future getMovieDetail(movieId) async {
    Uri url = Uri.parse('$_baseUrl/$movieId$_apiKey');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> movieDetail = jsonDecode(response.body);

      return movieDetail;
    } else {
      throw Exception('Error get data');
    }
  }

  Future getReviews(movieId) async {
    Uri url = Uri.parse('$_baseUrl/${movieId}/reviews$_apiKey');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['results'];
      List<ReviewsModel> reviews = [];

      for (var item in data) {
        reviews.add(ReviewsModel.fromJson(item));
      }

      return reviews;
    } else {
      throw Exception('Error get data');
    }
  }
}
