// To parse this JSON data, do
//
//     final competion = competionFromJson(jsonString);

import 'dart:convert';

List<Comptition> competitionFromJson(String str) => List<Comptition>.from(json.decode(str).map((x) => Comptition.fromJson(x)));

String competionToJson(List<Comptition> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Comptition {
  Comptition({
     required this.id,
    required   this.name,
    required   this.prize,
    required   this.description,
    required   this.startDate,
    required   this.endDate,

  });

  int id;
  String name;
  String prize;
  String description;
  DateTime startDate;
  DateTime endDate;


  factory Comptition.fromJson(Map<String, dynamic> json) => Comptition(
    id: json["id"],
    name: json["name"],
    prize: json["prize"],
    description: json["description"],
    startDate: DateTime.parse(json["start_date"]),
    endDate: DateTime.parse(json["end_date"]),

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "prize": prize,
    "description": description,
    "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",

  };
}
