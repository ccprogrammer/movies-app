class MovieDetailModel {
  int? id;
  String? title;
  String? poster;
  double? rating;
  List<Genre>? genre;

  MovieDetailModel({
    this.id,
    this.title,
    this.poster,
    this.rating,
    this.genre,
  });

  MovieDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['original_title'];
    poster = 'https://image.tmdb.org/t/p/w500' + json['poster_path'];
    rating = json['vote_average'].toDouble();
    genre = List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x)));
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'original_title': title,
      'poster_path': poster,
      'vote_average': rating,
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
