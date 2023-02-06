import 'dart:convert';

List<PrizeModel> prizeModelListFromJson(String str) =>
    List<PrizeModel>.from(json.decode(str).map((x) => PrizeModel.fromJson(x)));

String prizeModelToJson(List<PrizeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
PrizeModel prizeModelFromJson(String str) =>
    PrizeModel.fromJson(json.decode(str));

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

MyPrizesModel myPrizesModelFromJson(String str) =>
    MyPrizesModel.fromJson(json.decode(str));

String myPrizesModelToJson(MyPrizesModel data) => json.encode(data.toJson());

class MyPrizesModel {
  MyPrizesModel({
    required this.competitionPrize,
    required this.pointsPrize,
  });

  final List<CompetitionPrize> competitionPrize;
  final List<PointsPrize> pointsPrize;

  factory MyPrizesModel.fromJson(Map<String, dynamic> json) => MyPrizesModel(
        competitionPrize: List<CompetitionPrize>.from(
            json["جوائز المسابقات"].map((x) => CompetitionPrize.fromJson(x))),
    pointsPrize: List<PointsPrize>.from(
            json["جوائز النقاط"].map((x) => PointsPrize.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "جوائز المسابقات": List<dynamic>.from(competitionPrize.map((x) => x.toJson())),
        "جوائز النقاط":
            List<dynamic>.from(pointsPrize.map((x) => x.toJson())),
      };
}

class CompetitionPrize {
  CompetitionPrize({
    required this.id,
    required this.userId,
    required this.quizId,
    required this.result,
    required this.prize,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String userId;
  final String quizId;
  final String result;
  final String prize;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory CompetitionPrize.fromJson(Map<String, dynamic> json) =>
      CompetitionPrize(
        id: json["id"],
        userId: json["user_id"],
        quizId: json["quiz_id"],
        result: json["result"],
        prize: json["prize"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "quiz_id": quizId,
        "result": result,
        "prize": prize,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class PointsPrize {
  PointsPrize({
    required this.id,
    required this.userId,
    required this.prize,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String userId;
  final String prize;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory PointsPrize.fromJson(Map<String, dynamic> json) => PointsPrize(
        id: json["id"],
        userId: json["user_id"],
        prize: json["prize"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "prize": prize,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
