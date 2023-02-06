import 'dart:convert';

List<FavoriteModel> favoriteModelFromJson(String str) =>
    List<FavoriteModel>.from(
        json.decode(str).map((x) => FavoriteModel.fromJson(x)));

String favoriteModelToJson(List<FavoriteModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FavoriteModel {
  FavoriteModel({
    required this.id,
    required this.missionId,
    required this.userId,
    required this.mission,
  });

  final int id;
  final String missionId;
  final String userId;
  final Mission mission;

  factory FavoriteModel.fromJson(Map<String, dynamic> json) => FavoriteModel(
        id: json["id"],
        missionId: json["mission_id"],
        userId: json["user_id"],
        mission: Mission.fromJson(json["mission"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mission_id": missionId,
        "user_id": userId,
        "mission": mission.toJson(),
      };
}

class Mission {
  Mission({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.type,
    required this.description,
    required this.cases,
    required this.state,
  });

  final int id;
  final String name;
  final String image;
  final String price;
  final String type;
  final String description;
  final String cases;
  final String state;

  factory Mission.fromJson(Map<String, dynamic> json) => Mission(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        price: json["price"],
        type: json["type"],
        description: json["description"],
        cases: json["cases"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "price": price,
        "type": type,
        "description": description,
        "cases": cases,
        "state": state,
      };
}
