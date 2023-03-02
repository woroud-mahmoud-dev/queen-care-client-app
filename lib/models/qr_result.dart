import 'dart:convert';

QrResult qrResultFromJson(String str) => QrResult.fromJson(json.decode(str));

String qrResultToJson(QrResult data) => json.encode(data.toJson());

class QrResult {
  QrResult({
    required this.title,
    required this.body,
  });

  final String title;
  final String body;

  factory QrResult.fromJson(Map<String, dynamic> json) => QrResult(
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "body": body,
  };
}
