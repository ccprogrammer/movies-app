class RecommendationsModel {
  int? id;
  String? title;
  String? synopsis;
  String? poster;
  double? rating;
  String? releaseDate;

  RecommendationsModel({
    this.id,
    this.title,
    this.synopsis,
    this.poster,
    this.rating,
    this.releaseDate,
  });

  RecommendationsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['original_title'];
    synopsis = json['overview'];
    poster = 'https://image.tmdb.org/t/p/w500' + json['poster_path'];
    rating = json['vote_average'].toDouble();
    releaseDate = json['release_date'];
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'original_title': title,
      'poster_path': poster,
      'vote_average': rating,
      'overview': synopsis,
      'release_date': releaseDate,
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
