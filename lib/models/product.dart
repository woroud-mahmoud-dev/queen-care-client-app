// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    price: json["price"],
    type: json["type"],
    description: json["description"],
    cases: json["cases"],
    state: json["state"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    isfav: json["isfav"],
    iscart: json["iscart"],
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
  };
}
