
import 'dart:convert';

List<CartModel> cartModelFromJson(String str) => List<CartModel>.from(json.decode(str).map((x) => CartModel.fromJson(x)));

String cartModelToJson(List<CartModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartModel {
  CartModel({
    required this.id,
    required this.missionId,
    required this.userId,
    required this.amount,

    required this.mission,
  });

  int id;
  String missionId;
  String userId;
  String amount;
  Mission mission;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    id: json["id"],
    missionId: json["mission_id"],
    userId: json["user_id"],
    amount: json["amount"],

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

  int id;
  String name;
  String image;
  String price;

  String type;
  String description;
  String cases;
  String state;


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
