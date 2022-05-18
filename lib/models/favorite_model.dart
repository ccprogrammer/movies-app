class FavoriteModel {
  int? id;

  FavoriteModel({
    this.id,
  });

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }
}
