class FavoritesModel {
  String? title, image, author, description, id, review;
  num? averageRating;
  bool? isFavorite;

  FavoritesModel({
    this.image,
    this.author,
    this.description,
    this.averageRating,
    this.isFavorite,
    this.title,
    this.id,
    this.review,
  });

  FavoritesModel.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) {
      return;
    }
    author = json["author"];
    description = json["description"];
    averageRating = json["averageRating"];
    image = json["image"];
    isFavorite = json["isFavorite"];
    title = json["title"];
    id = json["id"];
    review = json["review"];
  }

  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'description': description,
      'averageRating': averageRating,
      'image': image,
      'isFavorite': isFavorite,
      'title': title,
      'id': id,
      'review':review,
    };
  }
}
