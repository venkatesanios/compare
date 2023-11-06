// To parse this JSON data, do
//
//     final filtersettingsModel = filtersettingsModelFromJson(jsonString);

import 'dart:convert';

FiltersettingsModel filtersettingsModelFromJson(String str) => FiltersettingsModel.fromJson(json.decode(str));

String filtersettingsModelToJson(FiltersettingsModel data) => json.encode(data.toJson());

class FiltersettingsModel {
  int? code;
  String? message;
  List<filterBackwashing>? data;

  FiltersettingsModel({
    this.code,
    this.message,
    this.data,
  });

  factory FiltersettingsModel.fromJson(Map<String, dynamic> json) => FiltersettingsModel(
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? [] : List<filterBackwashing>.from(json["data"]!.map((x) => filterBackwashing.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class filterBackwashing {
  String? title;
  int? widgetTypeId;
  String? iconCodePoint;
  String? iconFontFamily;
  dynamic value;
  bool? hidden;

  filterBackwashing({
    this.title,
    this.widgetTypeId,
    this.iconCodePoint,
    this.iconFontFamily,
    this.value,
    this.hidden,
  });

  factory filterBackwashing.fromJson(Map<String, dynamic> json) => filterBackwashing(
    title: json["title"],
    widgetTypeId: json["widgetTypeId"],
    iconCodePoint: json["iconCodePoint"],
    iconFontFamily: json["iconFontFamily"],
    value: json["value"],
    hidden: json["hidden"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "widgetTypeId": widgetTypeId,
    "iconCodePoint": iconCodePoint,
    "iconFontFamily": iconFontFamily,
    "value": value,
    "hidden": hidden,
  };
}
