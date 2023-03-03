
import 'dart:convert';

RegisterUserModel registerUserModelFromJson(String str) => RegisterUserModel.fromJson(json.decode(str));

String registerUserModelToJson(RegisterUserModel data) => json.encode(data.toJson());

class RegisterUserModel {
  RegisterUserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.city,
    required this.area,
    required this.country,
    required this.address,
    required this.phone,
    required this.roleId,
    required this.birthday,
    required this.fcm,
    required this.apiToken,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final String city;
  final String area;
  final String country;
  final String address;
  final String phone;
  final int roleId;
  final DateTime birthday;
  final String fcm;
  final String apiToken;
  final DateTime updatedAt;
  final DateTime createdAt;
  final int id;

  factory RegisterUserModel.fromJson(Map<String, dynamic> json) => RegisterUserModel(
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    gender: json["gender"],
    city: json["city"],
    area: json["area"],
    country: json["country"],
    address: json["address"],
    phone: json["phone"],
    roleId: json["role_id"],
    birthday: DateTime.parse(json["birthday"]),
    fcm: json["fcm"]??"",
    apiToken: json["api_token"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "gender": gender,
    "city": city,
    "area": area,
    "country": country,
    "address": address,
    "phone": phone,
    "role_id": roleId,
    "birthday": "${birthday.year.toString().padLeft(4, '0')}-${birthday.month.toString().padLeft(2, '0')}-${birthday.day.toString().padLeft(2, '0')}",
    "fcm": fcm,
    "api_token": apiToken,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
  };
}
