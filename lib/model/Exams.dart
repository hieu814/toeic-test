import 'dart:convert';

import 'package:toeic/model/Audio.dart';
import 'package:toeic/model/Image.dart';

class Exams {
  List<Exam>? exams;
  Exams({
    this.exams,
  });

  factory Exams.fromMap(Map<String, dynamic> map) {
    return Exams(
      exams: map['exams'] != null
          ? List<Exam>.from(map['exams']?.map((x) {
              return Exam.fromJson(x);
            }))
          : null,
    );
  }

  factory Exams.fromJson(String source) {
    source = "{ \"exams\":" + source + "}";
    return Exams.fromMap(json.decode(source));
  }
}

class Exam {
  String? sId;
  String? name;
  String? descripton;
  String? publishedAt;
  String? createdAt;
  String? updatedAt;
  int? iV;
  List<Parts>? parts;
  String? id;

  Exam(
      {this.sId,
      this.name,
      this.descripton,
      this.publishedAt,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.parts,
      this.id});

  Exam.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    descripton = json['descripton'];
    publishedAt = json['published_at'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    if (json['parts'] != null) {
      parts = <Parts>[];
      json['parts'].forEach((v) {
        parts!.add(new Parts.fromJson(v));
      });
    }
    id = json['id'];
  }
}

class Parts {
  String? type;
  String? sId;
  List<GroupQuestions>? groupQuestions;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? exam;
  String? id;

  Parts(
      {this.type,
      this.sId,
      this.groupQuestions,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.exam,
      this.id});

  Parts.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    sId = json['_id'];
    if (json['groupQuestions'] != null) {
      groupQuestions = <GroupQuestions>[];
      json['groupQuestions'].forEach((v) {
        groupQuestions!.add(new GroupQuestions.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    exam = json['exam'];
    id = json['id'];
  }
}

class GroupQuestions {
  String? sComponent;
  String? sId;
  List<QuestionComponent>? questions;
  int? iV;
  String? id;

  GroupQuestions({this.sComponent, this.sId, this.questions, this.iV, this.id});

  GroupQuestions.fromJson(Map<String, dynamic> json) {
    print("GroupQuestions.fromJson: ${json.toString()}");
    sComponent = json['__component'];
    sId = json['_id'];
    if (json['questions'] != null) {
      questions = <QuestionComponent>[];
      json['questions'].forEach((v) {
        questions!.add(new QuestionComponent.fromJson(v));
      });
    }
    iV = json['__v'];
    id = json['id'];
  }
}

class QuestionComponent {
  String? correctAnswer;
  String? sId;
  String? questionNumber;
  int? iV;
  Audio? audio;
  ImageModel? image;
  String? id;
  List<Question>? questions;
  String? transcript;
  List<Passages>? passages;

  QuestionComponent(
      {this.correctAnswer,
      this.sId,
      this.questionNumber,
      this.iV,
      this.audio,
      this.image,
      this.id,
      this.questions,
      this.transcript,
      this.passages});

  QuestionComponent.fromJson(Map<String, dynamic> json) {
    print("QuestionComponent.fromJson: ${json.toString()}");
    correctAnswer = json['correct_answer'];
    sId = json['_id'];
    questionNumber = json['question_number'];
    iV = json['__v'];
    // List<dynamic>
    audio = json['audio'] != null && !(json['audio'] is List<dynamic>)
        ? new Audio.fromJson(json['audio'])
        : null;
    image = json['image'] != null && !(json['image'] is List<dynamic>)
        ? new ImageModel.fromJson(json['image'])
        : null;
    id = json['id'];
    if (json['questions'] != null) {
      questions = <Question>[];
      json['questions'].forEach((v) {
        questions!.add(new Question.fromJson(v));
      });
    }
    transcript = json['transcript'];
    if (json['passages'] != null) {
      passages = <Passages>[];
      json['passages'].forEach((v) {
        passages!.add(new Passages.fromJson(v));
      });
    }
  }
}

class Question {
  String? correctAnswer;
  int? number;
  String? sId;
  String? question;
  String? a;
  String? b;
  String? c;
  String? d;
  int? iV;
  String? id;
  String? transcript;

  Question(
      {this.correctAnswer,
      this.number,
      this.sId,
      this.question,
      this.a,
      this.b,
      this.c,
      this.d,
      this.iV,
      this.id,
      this.transcript});

  Question.fromJson(Map<String, dynamic> json) {
    print("Question.fromJson: ${json.toString()}");
    correctAnswer = json['correct_answer'];
    number = json['number'];
    sId = json['_id'];
    question = json['question'];
    a = json['A'];
    b = json['B'];
    c = json['C'];
    d = json['D'];
    iV = json['__v'];
    id = json['id'];
    transcript = json['transcript'];
  }
}

class Passages {
  String? sId;
  int? iV;
  ImageModel? image;
  String? id;

  Passages({this.sId, this.iV, this.image, this.id});

  Passages.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    iV = json['__v'];
    image = json['image'] != null && !(json['image'] is List<dynamic>)
        ? new ImageModel.fromJson(json['image'])
        : null;
    id = json['id'];
  }
}
