import 'dart:convert';

List<Consultation> consultationFromJson(String str) => List<Consultation>.from(
    json.decode(str).map((x) => Consultation.fromJson(x)));

String consultationToJson(List<Consultation> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Consultation {
  Consultation({
    required this.id,
    required this.userId,
    required this.question,
    required this.answer,
  });

  final int id;
  final String userId;
  final String question;

  final List<Answer>? answer;

  factory Consultation.fromJson(Map<String, dynamic> json) => Consultation(
        id: json["id"],
        userId: json["user_id"],
        question: json["question"],
        answer: json["answer"] == null
            ? []
            : List<Answer>.from(json["answer"]!.map((x) => Answer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "question": question,
        "answer": answer == null
            ? []
            : List<dynamic>.from(answer!.map((x) => x.toJson())),
      };
}

class Answer {
  Answer({
    this.id,
    this.doctorId,
    this.questionId,
    this.answer,
  });

  final int? id;
  final String? doctorId;
  final String? questionId;
  final String? answer;

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        id: json["id"],
        doctorId: json["doctor_id"],
        questionId: json["question_id"],
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "doctor_id": doctorId,
        "question_id": questionId,
        "answer": answer,
      };
}
