import 'dart:convert';
class UserModel{
  dynamic id ;

dynamic name;
dynamic phone;
dynamic gender;
  dynamic api_token;
  dynamic email;

  // dynamic type;
  UserModel({
    this.id,
    this.api_token,
    this.gender,
    this.email,
    this.phone,
    this.name,
    // this.type,

});
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    // type: json["type"],
    gender: json["gender"],
    api_token: json["api_token"],
    id: json["id"],

  );



}

//
// class ProfileModel {
//   ProfileModel({
//     required this.name,
//     required this.email,
//     required this.phone,
//     required this.gender,
//     required this.apiToken,
//   });
//
//   final String name;
//   final String email;
//   final String phone;
//   final String gender;
//   final String apiToken;
//
//   factory ProfileModel.fromJson(String str) => ProfileModel.fromMap(json.decode(str));
//
//   String toJson() => json.encode(toMap());
//
//   factory ProfileModel.fromMap(Map<String, dynamic> json) => ProfileModel(
//     name: json["name"],
//     email: json["email"],
//     phone: json["phone"],
//     gender: json["gender"],
//     apiToken: json["api_token"],
//   );
//
//   Map<String, dynamic> toMap() => {
//     "name": name,
//     "email": email,
//     "phone": phone,
//     "gender": gender,
//     "api_token": apiToken,
//   };
// }
/*
{
    "name": "ali2",
    "email": "ali2@gmail.com",
    "phone": "0992955242",
    "type": 0,
    "gender": "0",
    "fcm": null,
    "api_token": "ttt4cxwGahyRUFKf1wYyHRQntenIL7dRGwwe0loRouy70nikq6aPAZKt7YYI",
    "updated_at": "2022-10-22T17:19:30.000000Z",
    "created_at": "2022-10-22T17:19:30.000000Z",
    "id": 2,
    "stars_average": null
}
*/