// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

ProfileModel profileFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
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

     required this.fcm,
     required this.apiToken,
     required this.emailVerifiedAt,
     required this.blocked,
     required this.state,
     required this.roleId,
     required this.point,

  });

  int id;
  String firstName;
  String lastName;
  String email;
  String gender;
  String city;
  String area;
  String country;
  String phone;
  String address;

  String fcm;
  String apiToken;
  dynamic emailVerifiedAt;
  String blocked;
  String state;
  String roleId;
  dynamic point;


  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    gender: json["gender"]??'',
    city: json["city"]??'',
    area: json["area"]??'',
    country: json["country"]??'',
    phone: json["phone"]??'',
    address: json["address"]??'',

    fcm: json["fcm"]??"",
    apiToken: json["api_token"]??'',
    emailVerifiedAt: json["email_verified_at"]??'',
    blocked: json["blocked"]??'',
    state: json["state"]??'',
    roleId: json["role_id"]??'',
    point: json["point"]??"",

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
    "fcm": fcm,
    "api_token": apiToken,
    "email_verified_at": emailVerifiedAt,
    "blocked": blocked,
    "state": state,
    "role_id": roleId,
    "point": point,

  };
}
