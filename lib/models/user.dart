// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
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
    required this.apiToken,
   
    required this.id,
  });

  String firstName;
  String lastName;
  String email;
  String gender;
  String city;
  String area;
  String country;
  String address;
  String phone;
  String roleId;
  DateTime birthday;

  String apiToken;

  int id;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
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
    apiToken: json["api_token"],

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

    "api_token": apiToken,

    "id": id,
  };
}
