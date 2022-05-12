import 'package:http/http.dart';

class MovieModel {
  int? id;
  String? title;
  String? poster;
  double? rating;

  MovieModel({
    this.id,
    this.title,
    this.poster,
    this.rating,
  });

  MovieModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    poster = 'https://image.tmdb.org/t/p/w500' + json['poster_path'];
    rating = json['vote_average'].toDouble();

  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'poster_path': poster,
      'vote_average': rating,
    };
  }
}
