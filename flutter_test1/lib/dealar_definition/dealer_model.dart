// To parse this JSON data, do
//
//     final dealerdefinition = dealerdefinitionFromJson(jsonString);
// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  String? message;
  int? code;
  List<Valuesdetails>? general;
  List<Valuesdetails>? fertilizer;
  List<Valuesdetails>? valve;
  List<Valuesdetails>? memory;

  Welcome({
    this.message,
    this.code,
    this.general,
    this.fertilizer,
    this.valve,
    this.memory,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        message: json["message"],
        code: json["code"],
        general: json["General"] == null
            ? []
            : List<Valuesdetails>.from(
                json["General"]!.map((x) => Valuesdetails.fromJson(x))),
        fertilizer: json["Fertilizer"] == null
            ? []
            : List<Valuesdetails>.from(
                json["Fertilizer"]!.map((x) => Valuesdetails.fromJson(x))),
        valve: json["Valve"] == null
            ? []
            : List<Valuesdetails>.from(
                json["Valve"]!.map((x) => Valuesdetails.fromJson(x))),
        memory: json["Memory"] == null
            ? []
            : List<Valuesdetails>.from(
                json["Memory"]!.map((x) => Valuesdetails.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "code": code,
        "General": general == null
            ? []
            : List<dynamic>.from(general!.map((x) => x.toJson())),
        "Fertilizer": fertilizer == null
            ? []
            : List<dynamic>.from(fertilizer!.map((x) => x.toJson())),
        "Valve": valve == null
            ? []
            : List<dynamic>.from(valve!.map((x) => x.toJson())),
        "Memory": memory == null
            ? []
            : List<dynamic>.from(memory!.map((x) => x.toJson())),
      };
}

class Valuesdetails {
  String? title;
  String? description;
  String? value;
  String? valuetype;
  List<dynamic>? dropdownlist;

  Valuesdetails({
    this.title,
    this.description,
    this.value,
    this.valuetype,
    this.dropdownlist,
  });

  factory Valuesdetails.fromJson(Map<String, dynamic> json) => Valuesdetails(
        title: json["title"],
        description: json["description"],
        value: json["value"],
        valuetype: json["valuetype"],
        dropdownlist: json["dropdownlist"] == null
            ? []
            : List<dynamic>.from(json["dropdownlist"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "value": value,
        "valuetype": valuetype,
        "dropdownlist": dropdownlist == null
            ? []
            : List<dynamic>.from(dropdownlist!.map((x) => x)),
      };
}

class DealerModel {
  final String title;
  final String description;
  final String value;
  final String valuetype;

  DealerModel({
    required this.title,
    required this.description,
    required this.value,
    required this.valuetype,
  });
}
