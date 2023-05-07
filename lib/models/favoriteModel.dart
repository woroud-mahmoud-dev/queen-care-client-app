

import 'dart:convert';

import 'package:queen_care/models/cart_model.dart';

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


