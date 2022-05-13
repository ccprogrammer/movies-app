class SimilarMovieModel {
  int? id;
  String? title;
  String? poster;
  String? synopsis;

  SimilarMovieModel({
    this.id,
    this.title,
    this.poster,
    this.synopsis,
  });

  SimilarMovieModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['original_title'];
    poster = 'https://image.tmdb.org/t/p/w500' + json['poster_path'];
    synopsis = json['overview'];

  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'original_title': title,
      'poster_path': poster,
      'overview': synopsis,
    };
  }
}
