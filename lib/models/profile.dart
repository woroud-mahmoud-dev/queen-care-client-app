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

 final int id;
  final String firstName;
  final  String lastName;
  final String email;
  final String gender;
  final String city;
  final  String area;
  final  String country;
  final String phone;
  final String address;

  final String fcm;
  final String apiToken;
  dynamic emailVerifiedAt;
  final  String blocked;
  final  String state;
  final  String roleId;
  final  dynamic point;


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
