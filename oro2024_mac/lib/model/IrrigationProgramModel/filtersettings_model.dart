// To parse this JSON data, do
//
//     final filtersettingsModel = filtersettingsModelFromJson(jsonString);

import 'dart:convert';

FiltersettingsModel filtersettingsModelFromJson(String str) => FiltersettingsModel.fromJson(json.decode(str));

String filtersettingsModelToJson(FiltersettingsModel data) => json.encode(data.toJson());

class FiltersettingsModel {
  int? code;
  String? message;
  Data? data;

  FiltersettingsModel({
    this.code,
    this.message,
    this.data,
  });

  factory FiltersettingsModel.fromJson(Map<String, dynamic> json) => FiltersettingsModel(
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
  List<FilterBackwashing>? filterBackwashing;

  Data({
    this.filterBackwashing,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    filterBackwashing: json["filterBackwashing"] == null ? [] : List<FilterBackwashing>.from(json["filterBackwashing"]!.map((x) => FilterBackwashing.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "filterBackwashing": filterBackwashing == null ? [] : List<dynamic>.from(filterBackwashing!.map((x) => x.toJson())),
  };
}

class FilterBackwashing {
  String? title;
  int? widgetTypeId;
  String? iconCodePoint;
  String? iconFontFamily;
  dynamic value;
  bool? hidden;

  FilterBackwashing({
    this.title,
    this.widgetTypeId,
    this.iconCodePoint,
    this.iconFontFamily,
    this.value,
    this.hidden,
  });

  factory FilterBackwashing.fromJson(Map<String, dynamic> json) => FilterBackwashing(
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
    "iconFontFamily":  iconFontFamily,
    "value": value,
    "hidden": hidden,
  };
}
