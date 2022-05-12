class MovieDetailModel {
  int? id;
  String? title;
  String? poster;
  double? rating;

  MovieDetailModel({
    this.id,
    this.title,
    this.poster,
    this.rating,
  });

  MovieDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['original_title'];
    poster = 'https://image.tmdb.org/t/p/w500' + json['poster_path'];
    rating = json['vote_average'].toDouble();
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
