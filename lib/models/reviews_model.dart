import 'package:intl/intl.dart';

class ReviewsModel {
  String? id;
  String? username;
  String? avatar;
  String? review;
  double? rating;
  String? createdAt;

  ReviewsModel({
    this.id,
    this.username,
    this.avatar,
    this.review,
    this.createdAt,
    this.rating,
  });

  ReviewsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['author_details']['username'];
    // avatar = 'https://image.tmdb.org/t/p/w500' +
    //     json['author_details']['avatar_path'];
    rating = json['author_details']['rating'];
    review = json['content'];
    createdAt = DateFormat.yMMMMd().format(DateTime.parse(json['created_at']));
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'avatar_path': avatar,
      'rating': rating,
      'review': review,
      'created_at': createdAt,
    };
  }
}
