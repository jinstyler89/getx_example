// To parse this JSON data, do
//
//     final projectModel = projectModelFromJson(jsonString);

import 'dart:convert';

ProjectModel projectModelFromJson(String str) =>
    ProjectModel.fromJson(json.decode(str));

String projectModelToJson(ProjectModel data) => json.encode(data.toJson());

class ProjectModel {
  ProjectModel({
    this.code,
    this.data,
    this.message,
    this.status,
  });

  String? code;
  List<Datum>? data;
  String? message;
  int? status;

  factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
        code: json["code"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message,
        "status": status,
      };
}

class Datum {
  Datum({
    this.id,
    this.username,
    this.amount,
    this.people,
    this.content,
  });

  String? id;
  String? username;
  String? amount;
  String? people;
  String? content;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        username: json["username"],
        amount: json["amount"],
        people: json["people"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "amount": amount,
        "people": people,
        "content": content,
      };
}
