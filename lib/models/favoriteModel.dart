// To parse this JSON data, do
//
//     final favoriteModel = favoriteModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<FavoriteModel> favoriteModelFromJson(String str) => List<FavoriteModel>.from(json.decode(str).map((x) => FavoriteModel.fromJson(x)));

String favoriteModelToJson(List<FavoriteModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FavoriteModel {
  FavoriteModel({
    required this.id,
    required this.missionId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.mission,
  });

  int id;
  String missionId;
  String userId;
  DateTime createdAt;
  DateTime updatedAt;
  Mission mission;

  factory FavoriteModel.fromJson(Map<String, dynamic> json) => FavoriteModel(
    id: json["id"],
    missionId: json["mission_id"],
    userId: json["user_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    mission: Mission.fromJson(json["mission"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "mission_id": missionId,
    "user_id": userId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "mission": mission == null ? null : mission.toJson(),
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
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String image;
  String price;
  String type;
  String description;
  String cases;
  String state;
  dynamic createdAt;
  dynamic updatedAt;

  factory Mission.fromJson(Map<String, dynamic> json) => Mission(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    price: json["price"],
    type: json["type"],
    description: json["description"],
    cases: json["cases"],
    state: json["state"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
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
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
