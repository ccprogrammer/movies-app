import 'package:intl/intl.dart';

class SearchMovieModel {
  int? id;
  String? title;
  String? synopsis;
  String? poster;

  SearchMovieModel({
    this.id,
    this.title,
    this.synopsis,
    this.poster,
  });

  SearchMovieModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['original_title'];
    synopsis = json['overview'];
    poster = 'https://image.tmdb.org/t/p/w500' + json['poster_path'];
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'original_title': title,
      'overview': synopsis,
      'poster_path': poster,
    };
  }
}
