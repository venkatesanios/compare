// To parse this JSON data, do
//
//     final virtualWaterMeterModel = virtualWaterMeterModelFromJson(jsonString);

import 'dart:convert';

VirtualWaterMeterModel virtualWaterMeterModelFromJson(String str) => VirtualWaterMeterModel.fromJson(json.decode(str));

String virtualWaterMeterModelToJson(VirtualWaterMeterModel data) => json.encode(data.toJson());

class VirtualWaterMeterModel {
  int? code;
  String? message;
  Data? data;

  VirtualWaterMeterModel({
    this.code,
    this.message,
    this.data,
  });

  factory VirtualWaterMeterModel.fromJson(Map<String, dynamic> json) => VirtualWaterMeterModel(
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  List<Plan>? plan;
  List<VirtualWaterMeter>? virtualWaterMeter;

  Data({
    this.plan,
    this.virtualWaterMeter,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    plan: json["plan"] == null ? [] : List<Plan>.from(json["plan"]!.map((x) => Plan.fromJson(x))),
    virtualWaterMeter: json["virtualWaterMeter"] == null ? [] : List<VirtualWaterMeter>.from(json["virtualWaterMeter"]!.map((x) => VirtualWaterMeter.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "plan": plan == null ? [] : List<dynamic>.from(plan!.map((x) => x.toJson())),
    "virtualWaterMeter": virtualWaterMeter == null ? [] : List<dynamic>.from(virtualWaterMeter!.map((x) => x.toJson())),
  };
}

class Plan {
  int? sNo;
  String? id;
  String? location;
  String? name;
  String? function;
  String? formula;
  String? protectionLimit;
  String? object;
  String? action;
  String? radio;

  Plan({
    this.sNo,
    this.id,
    this.location,
    this.name,
    this.function,
    this.formula,
    this.protectionLimit,
    this.object,
    this.action,
    this.radio,
  });

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
    sNo: json["sNo"],
    id: json["id"],
    location: json["location"],
    name: json["name"],
    function: json["function"],
    formula: json["formula"],
    protectionLimit: json["protectionLimit"],
    object: json["object"],
    action: json["action"],
    radio: json["radio"],
  );

  Map<String, dynamic> toJson() => {
    "sNo": sNo,
    "id": id,
    "location": location,
    "name": name,
    "function": function,
    "formula": formula,
    "protectionLimit": protectionLimit,
    "object": object,
    "action": action,
    "radio": radio,
  };
}

class VirtualWaterMeter {
  String? sNo;
  String? id;
  String? location;
  String? name;
  bool? plus;
  bool? minus;

  VirtualWaterMeter({
    this.sNo,
    this.id,
    this.location,
    this.name,
    this.plus,
    this.minus,
  });

  factory VirtualWaterMeter.fromJson(Map<String, dynamic> json) => VirtualWaterMeter(
    sNo: json["sNo"],
    id: json["id"],
    location: json["location"],
    name: json["name"],
    plus: json["plus"],
    minus: json["minus"],
  );

  Map<String, dynamic> toJson() => {
    "sNo": sNo,
    "id": id,
    "location": location,
    "name": name,
    "plus": plus,
    "minus": minus,
  };
}
