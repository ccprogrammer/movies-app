class FavoriteModel {
  int? id;
  String? title;
  String? synopsis;
  String? poster;
  double? rating;

  FavoriteModel({
    this.id,
    this.title,
    this.synopsis,
    this.poster,
    this.rating,
  });

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['original_title'];
    synopsis = json['overview'];
    poster = 'https://image.tmdb.org/t/p/w500' + json['poster_path'];
    rating = json['vote_average'].toDouble();
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'original_title': title,
      'poster_path': poster,
      'vote_average': rating,
      'overview': synopsis,
    };
  }
}
