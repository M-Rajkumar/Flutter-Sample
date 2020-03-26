// To parse this JSON data, do
//
//     final questionAnswer = questionAnswerFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class LiveQuestion {
  final List<QuestionOption> questionOptions;
  final List<dynamic> questionAnswer;
  final QuestionType questionType;
  final int engagementType;
  final int type;
  final String question;
  final int id;

  LiveQuestion({
    @required this.questionOptions,
    @required this.questionAnswer,
    @required this.questionType,
    @required this.engagementType,
    @required this.type,
    @required this.question,
    @required this.id,
  });

  factory LiveQuestion.fromJson(String str) => LiveQuestion.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LiveQuestion.fromMap(Map<String, dynamic> json) => LiveQuestion(
        questionOptions: json["questionOptions"] == null
            ? null
            : List<QuestionOption>.from(json["questionOptions"].map((x) => QuestionOption.fromMap(x))),
        questionAnswer:
            json["questionAnswer"] == null ? null : List<dynamic>.from(json["questionAnswer"].map((x) => x)),
        questionType: json["questionType"] == null ? null : QuestionType.fromMap(json["questionType"]),
        engagementType: json["engagementType"] == null ? null : json["engagementType"],
        type: json["type"] == null ? null : json["type"],
        question: json["question"] == null ? null : json["question"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toMap() => {
        "questionOptions": questionOptions == null ? null : List<dynamic>.from(questionOptions.map((x) => x.toMap())),
        "questionAnswer": questionAnswer == null ? null : List<dynamic>.from(questionAnswer.map((x) => x)),
        "questionType": questionType == null ? null : questionType.toMap(),
        "engagementType": engagementType == null ? null : engagementType,
        "type": type == null ? null : type,
        "question": question == null ? null : question,
        "id": id == null ? null : id,
      };
}

class QuestionOption {
  final int question;
  final int optionNumber;
  final String optionText;
  final int id;

  QuestionOption({
    @required this.question,
    @required this.optionNumber,
    @required this.optionText,
    @required this.id,
  });

  factory QuestionOption.fromJson(String str) => QuestionOption.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory QuestionOption.fromMap(Map<String, dynamic> json) => QuestionOption(
        question: json["question"] == null ? null : json["question"],
        optionNumber: json["option_number"] == null ? null : json["option_number"],
        optionText: json["option_text"] == null ? null : json["option_text"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toMap() => {
        "question": question == null ? null : question,
        "option_number": optionNumber == null ? null : optionNumber,
        "option_text": optionText == null ? null : optionText,
        "id": id == null ? null : id,
      };
}

class QuestionType {
  final String typeName;
  final String typeDesc;
  final int id;

  QuestionType({
    @required this.typeName,
    @required this.typeDesc,
    @required this.id,
  });

  factory QuestionType.fromJson(String str) => QuestionType.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory QuestionType.fromMap(Map<String, dynamic> json) => QuestionType(
        typeName: json["typeName"] == null ? null : json["typeName"],
        typeDesc: json["typeDesc"] == null ? null : json["typeDesc"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toMap() => {
        "typeName": typeName == null ? null : typeName,
        "typeDesc": typeDesc == null ? null : typeDesc,
        "id": id == null ? null : id,
      };
}
