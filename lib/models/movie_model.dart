import 'package:intl/intl.dart';

class MovieModel {
  int? id;
  String? title;
  String? synopsis;
  String? poster;
  String? releaseDate;
  double? rating;
  List<Genre>? genre;

  MovieModel({
    this.id,
    this.title,
    this.synopsis,
    this.poster,
    this.releaseDate,
    this.rating,
    this.genre,
  });

  MovieModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['original_title'];
    synopsis = json['overview'];
    poster = 'https://image.tmdb.org/t/p/w500' + json['poster_path'];
    releaseDate = DateFormat.yMMMMd().format(DateTime.parse(json['release_date']));
    rating = json['vote_average'].toDouble();
    genre = List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x)));
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'original_title': title,
      'poster_path': poster,
      'release_date': releaseDate,
      'vote_average': rating,
      'overview': synopsis,
    };
  }
}

class Genre {
  Genre({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
