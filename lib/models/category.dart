

import 'dart:convert';

List<Category> categoryFromJson(String str) => List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));

String categoryToJson(List<Category> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Category {
  Category({
  required  this.id,
    required this.type,
    required  this.image,

  });

 final int id;
  final String type;
  final  String image;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    type: json["type"],
    image: json["image"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "image": image,

  };
  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] as int,
      type: map['type'] as String,
      image: map['image'] as String,

    );
  }

}
