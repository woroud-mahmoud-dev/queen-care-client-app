
import 'dart:convert';


List<PrizeModel> prizeModelListFromJson(String str) => List<PrizeModel>.from(json.decode(str).map((x) => PrizeModel.fromJson(x)));

String prizeModelToJson(List<PrizeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
PrizeModel prizeModelFromJson(String str) => PrizeModel.fromJson(json.decode(str));




class PrizeModel {
  PrizeModel({
    required this.userId,
    required this.quizId,
    required this.result,
    required this.prize,
    required this.id,
  });

  dynamic userId;
  dynamic quizId;
  dynamic result;
  dynamic prize;

  dynamic id;

  factory PrizeModel.fromJson(Map<String, dynamic> json) => PrizeModel(
        userId: json["user_id"],
        quizId: json["quiz_id"],
        result: json["result"],
        prize: json["prize"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "quiz_id": quizId,
        "result": result,
        "prize": prize,
        "id": id,
      };
}
// https://karam-app.com/celo/queencare/public/api/my_prize