import 'package:intl/intl.dart';

class HomeMovieModel {
  int? id;
  String? title;
  String? poster;
  String? releaseDate;
  double? rating;

  HomeMovieModel({
    this.id,
    this.title,
    this.poster,
    this.rating,
  });

  HomeMovieModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['original_title'];
    poster = 'https://image.tmdb.org/t/p/w500' + json['poster_path'];
    releaseDate = DateFormat.yMMMMd().format(DateTime.parse(json['release_date']));
    rating = json['vote_average'].toDouble();
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'original_title': title,
      'poster_path': poster,
      'release_date': releaseDate,
      'vote_average': rating,
    };
  }
}
