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
    required this.isfav,
    required this.iscart,
  });

  final int id;
  final String name;
  final String image;
  final String price;
  final String type;
  final String description;
  final String cases;
  final String state;

  final bool isfav;
  final bool iscart;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        price: json["price"],
        type: json["type"],
        description: json["description"],
        cases: json["cases"],
        state: json["state"],
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
        "isfav": isfav,
        "iscart": iscart,
      };
}
