import 'dart:convert';

List<BlogModel> blogModelFromJson(String str) =>
    List<BlogModel>.from(json.decode(str).map((x) => BlogModel.fromJson(x)));

String blogModelToJson(List<BlogModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BlogModel {
  BlogModel({
    required this.id,
    required this.name,
    required this.image,
    required this.body,
    required this.categoryBlogId,
    required this.state,
  });

  final int id;
  final String name;
  final String image;
  final String body;
  final String categoryBlogId;
  final String state;

  factory BlogModel.fromJson(Map<String, dynamic> json) => BlogModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        body: json["body"],
        categoryBlogId: json["category_blog_id"],
        state: json["state"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "body": body,
        "category_blog_id": categoryBlogId,
        "state": state,
      };
}
