import 'package:intl/intl.dart';

class ReviewsModel {
  String? id;
  String? username;
  String? review;
  double? rating = 10.0;
  String? createdAt;

  ReviewsModel({
    this.id,
    this.username,
    this.review,
    this.createdAt,
    this.rating,
  });

  ReviewsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['author_details']['username'];
  
    rating = json['author_details']['rating'];
    review = json['content'];
    createdAt = DateFormat.yMMMMd().format(DateTime.parse(json['created_at']));
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'rating': rating,
      'review': review,
      'created_at': createdAt,
    };
  }
}
