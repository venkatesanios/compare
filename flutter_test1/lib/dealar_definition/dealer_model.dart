// To parse this JSON data, do
//
//     final dealerdefinition = dealerdefinitionFromJson(jsonString);

import 'dart:convert';

Dealerdefinition dealerdefinitionFromJson(String str) =>
    Dealerdefinition.fromJson(json.decode(str));

String dealerdefinitionToJson(Dealerdefinition data) =>
    json.encode(data.toJson());

class Dealerdefinition {
  String? message;
  List<Valuesdetails>? general;
  List<Valuesdetails>? fertilizer;
  List<Valuesdetails>? valve;
  List<Valuesdetails>? memory;

  Dealerdefinition({
    this.message,
    this.general,
    this.fertilizer,
    this.valve,
    this.memory,
  });

  factory Dealerdefinition.fromJson(Map<String, dynamic> json) =>
      Dealerdefinition(
        message: json["message"],
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

  Valuesdetails({
    this.title,
    this.description,
    this.value,
    this.valuetype,
  });

  factory Valuesdetails.fromJson(Map<String, dynamic> json) => Valuesdetails(
        title: json["title"],
        description: json["description"],
        value: json["value"],
        valuetype: json["valuetype"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "value": value,
        "valuetype": valuetype,
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
