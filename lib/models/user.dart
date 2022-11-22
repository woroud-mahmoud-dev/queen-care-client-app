
import 'dart:convert';
class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.type,
    required this.gender,
    required this.apiToken,
    required this.fcm,

    required this.fcmToken,
    required this.starsAverage,
  });
  final dynamic id;
  final dynamic name;
  final dynamic phone;
  final dynamic email;
  final dynamic type;
  final dynamic gender;
  final dynamic apiToken;
  final dynamic fcm;

  final dynamic fcmToken;
  final dynamic starsAverage;

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
    id: json["id"] == null ? null : json["id"],
    name: json["name"],
    phone: json["phone"] == null ? null : json["phone"],
    email: json["email"],
    type: json["type"] == null ? null : json["type"],
    gender: json["gender"],
    apiToken: json["api_token"] == null ? null : json["api_token"],
    fcm: json["fcm"],

    fcmToken: json["fcm_token"],
    starsAverage: json["stars_average"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "name": name,
    "phone": phone == null ? null : phone,
    "email": email,
    "type": type == null ? null : type,
    "gender": gender,
    "api_token": apiToken == null ? null : apiToken,
    "fcm": fcm,

    "fcm_token": fcmToken,
    "stars_average": starsAverage,
  };
}
