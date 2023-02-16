import 'dart:convert';

List<Question> questionFromJson(String str) => List<Question>.from(json.decode(str).map((x) => Question.fromJson(x)));

String questionToJson(List<Question> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Question {
  Question({
required    this.id,
    required   this.quizId,
    required   this.ques,
    required    this.a,
    required   this.b,
    required   this.c,
    required   this.d,
    required   this.answer,

  });

  int id;
  String quizId;
  String ques;
  String a;
  String b;
  String c;
  String d;
  String answer;


  factory Question.fromJson(Map<String, dynamic> json) => Question(
    id: json["id"],
    quizId: json["quiz_id"],
    ques: json["ques"],
    a: json["a"],
    b: json["b"],
    c: json["c"],
    d: json["d"],
    answer: json["answer"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "quiz_id": quizId,
    "ques": ques,
    "a": a,
    "b": b,
    "c": c,
    "d": d,
    "answer": answer,

  };
}
