class AuthModel {
  String? uId, email, name, image;

  AuthModel({this.uId, this.email, this.name, this.image});

  AuthModel.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) {
      return;
    }
    uId = json["uId"];
    email = json["email"];
    name = json["name"];
    image = json["image"];
  }

  Map<String, dynamic> toJson() {
    return {
      'uId': uId,
      'email': email,
      'name': name,
      'image': image,
    };
  }
}