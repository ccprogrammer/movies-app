import 'package:flutter/material.dart';
import 'package:movies_app/models/reviews_model.dart';
import 'package:movies_app/services/http_services.dart';

class ReviewsProvider with ChangeNotifier {
  List<ReviewsModel> _reviews = [];
  bool _isLoading = true;

  List<ReviewsModel> get reviews => _reviews;
  bool get isLoading => _isLoading;

  Future getReviews(movieId) async {
    _isLoading = true;

    try {
      List<ReviewsModel> reviews = await Http().getReviews(movieId);
      _reviews = reviews;
      _isLoading = false;
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
