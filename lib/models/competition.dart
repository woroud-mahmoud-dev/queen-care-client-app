
import 'dart:convert';

List<Competition> competitionFromJson(String str) =>
    List<Competition>.from(json.decode(str).map((x) => Competition.fromJson(x)));

String competitionToJson(List<Competition> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Competition {
  Competition({
    required this.id,
    required this.name,
    required this.prize,
    required this.description,
    required this.startDate,
    required this.endDate,
  });

  final int id;
  final String name;
  final String prize;
  final String description;
  final DateTime startDate;
  final DateTime endDate;

  factory Competition.fromJson(Map<String, dynamic> json) => Competition(
        id: json["id"],
        name: json["name"]??"",
        prize: json["prize"]??"",
        description: json["description"]??"",
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "prize": prize,
        "description": description,
        "start_date":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
      };
}
