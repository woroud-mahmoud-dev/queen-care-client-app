
import 'dart:convert';

MyPointsPrizeModel myPointsPrizeModelFromJson(String str) => MyPointsPrizeModel.fromJson(json.decode(str));

String myPointsPrizeModelToJson(MyPointsPrizeModel data) => json.encode(data.toJson());

class MyPointsPrizeModel {
  MyPointsPrizeModel({
    required this.prize,
  });

  final List<String> prize;

  factory MyPointsPrizeModel.fromJson(Map<String, dynamic> json) => MyPointsPrizeModel(
    prize: List<String>.from(json["الجوائز(اختر احدها)"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "الجوائز(اختر احدها)": List<dynamic>.from(prize.map((x) => x)),
  };
}
