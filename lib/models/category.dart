

import 'dart:convert';

List<CategoryModel> categoryFromJson(String str) => List<CategoryModel>.from(json.decode(str).map((x) => CategoryModel.fromJson(x)));

String categoryToJson(List<CategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel {
  CategoryModel({
  required  this.id,
    required this.type,
    required  this.image,

  });

 final int id;
  final String type;
  final  String image;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id: json["id"],
    type: json["type"],
    image: json["image"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "image": image,

  };
  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as int,
      type: map['type'] as String,
      image: map['image'] as String,

    );
  }

}
