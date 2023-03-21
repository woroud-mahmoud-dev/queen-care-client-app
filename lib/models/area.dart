import 'dart:convert';

List<Area> areaFromJson(String str) =>
    List<Area>.from(json.decode(str).map((x) => Area.fromJson(x)));

String areaToJson(List<Area> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Area {
  Area({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory Area.fromJson(Map<String, dynamic> json) => Area(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
