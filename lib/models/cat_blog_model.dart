import 'dart:convert';

List<CategoryBlogModel> categoryBlogModelFromJson(String str) =>
    List<CategoryBlogModel>.from(
        json.decode(str).map((x) => CategoryBlogModel.fromJson(x)));

String categoryBlogModelToJson(List<CategoryBlogModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryBlogModel {
  CategoryBlogModel({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory CategoryBlogModel.fromJson(Map<String, dynamic> json) =>
      CategoryBlogModel(
        id: json["id"],
        name: json["name"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
