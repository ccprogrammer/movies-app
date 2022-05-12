class NowPlayingModel {
  int? id;
  String? title;
  String? poster;
  double? rating;

  NowPlayingModel({
    this.id,
    this.title,
    this.poster,
    this.rating,
  });

  NowPlayingModel.fromJson(Map<String, dynamic> json) {
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
