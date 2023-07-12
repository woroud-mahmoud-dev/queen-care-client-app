
import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  ProductModel({
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
    required this.isfav,
    required this.iscart,
    required this.enName,
    required this.enDescription,
    required this.enType,
    required this.enCases,
    required this.unitMission,
  });

  int id;
  String name;
  String image;
  String price;
  String type;
  String description;

  String cases;
  String state;
  DateTime createdAt;
  DateTime updatedAt;
  bool isfav;
  bool iscart;
  String enName;
  String enType;
  String enDescription;
  String enCases;
  String? unitMission;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    name: json["name"]??"",
    image: json["image"]??"",
    price: json["price"]??"0",
    type: json["type"]??"1",
    description: json["description"] ?? "",

    cases: json["cases"]??"",
    state: json["state"]??"",
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    isfav: json["isfav"]??false,
    enName: json["en_name"]??"",
    iscart: json["iscart"]??false,
    enType: json["en_type"]??"1",
    enDescription: json["en_description"]??"",
    enCases: json["en_cases"]??"",
    unitMission: json["unit_mission"]??"",
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
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "isfav": isfav,
    "iscart": iscart,
    "en_name": enName,
    "en_type": enType,
    "en_description": enDescription,
    "en_cases": enCases,
    "unit_mission": unitMission,
  };
}
