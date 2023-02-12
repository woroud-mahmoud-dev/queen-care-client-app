
import 'dart:convert';

PointsModel pointsModelFromJson(String str) => PointsModel.fromJson(json.decode(str));

String pointsModelToJson(PointsModel data) => json.encode(data.toJson());

class PointsModel {
  PointsModel({
    required this.pointsModel,
    required this.result,
  });

  final Result pointsModel;
  final String result;

  factory PointsModel.fromJson(Map<String, dynamic> json) => PointsModel(
    pointsModel: Result.fromJson(json["النقاط"]),
    result: json["النتيجه"],
  );

  Map<String, dynamic> toJson() => {
    "النقاط": pointsModel.toJson(),
    "النتيجه": result,
  };
}

class Result {
  Result({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.city,
    required this.area,
    required this.country,
    required this.phone,
    required this.address,
    required this.birthday,
    required this.fcm,
    required this.apiToken,
    required this.emailVerifiedAt,
    required this.blocked,
    required this.state,
    required this.roleId,
    required this.type,
    required this.point,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final String city;
  final String area;
  final String country;
  final String phone;
  final String address;
  final DateTime birthday;
  final dynamic fcm;
  final String apiToken;
  final dynamic emailVerifiedAt;
  final String blocked;
  final String state;
  final String roleId;
  final String type;
  final double point;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    gender: json["gender"],
    city: json["city"],
    area: json["area"],
    country: json["country"],
    phone: json["phone"],
    address: json["address"],
    birthday: DateTime.parse(json["birthday"]),
    fcm: json["fcm"],
    apiToken: json["api_token"],
    emailVerifiedAt: json["email_verified_at"],
    blocked: json["blocked"],
    state: json["state"],
    roleId: json["role_id"],
    type: json["type"],
    point: json["point"]?.toDouble(),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "gender": gender,
    "city": city,
    "area": area,
    "country": country,
    "phone": phone,
    "address": address,
    "birthday": "${birthday.year.toString().padLeft(4, '0')}-${birthday.month.toString().padLeft(2, '0')}-${birthday.day.toString().padLeft(2, '0')}",
    "fcm": fcm,
    "api_token": apiToken,
    "email_verified_at": emailVerifiedAt,
    "blocked": blocked,
    "state": state,
    "role_id": roleId,
    "type": type,
    "point": point,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
