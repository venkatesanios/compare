import 'dart:convert';

Dealerdefinition dealerdefinitionFromJson(String str) =>
    Dealerdefinition.fromJson(json.decode(str));

String dealerdefinitionToJson(Dealerdefinition data) =>
    json.encode(data.toJson());

class Dealerdefinition {
  int? code;
  String? message;
  Data? data;

  Dealerdefinition({
    this.code,
    this.message,
    this.data,
  });

  factory Dealerdefinition.fromJson(Map<String, dynamic> json) =>
      Dealerdefinition(
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
  List<DealerDefinitionValue>? general;
  List<DealerDefinitionValue>? fertilization;
  List<DealerDefinitionValue>? valveDefaults;
  List<DealerDefinitionValue>? memoryAllocations;

  Data({
    this.general,
    this.fertilization,
    this.valveDefaults,
    this.memoryAllocations,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        general: json["General"] == null
            ? []
            : List<DealerDefinitionValue>.from(
                json["General"]!.map((x) => DealerDefinitionValue.fromJson(x))),
        fertilization: json["Fertilization"] == null
            ? []
            : List<DealerDefinitionValue>.from(json["Fertilization"]!
                .map((x) => DealerDefinitionValue.fromJson(x))),
        valveDefaults: json["Valve defaults"] == null
            ? []
            : List<DealerDefinitionValue>.from(json["Valve defaults"]!
                .map((x) => DealerDefinitionValue.fromJson(x))),
        memoryAllocations: json["Memory allocations"] == null
            ? []
            : List<DealerDefinitionValue>.from(json["Memory allocations"]!
                .map((x) => DealerDefinitionValue.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "General": general == null
            ? []
            : List<dynamic>.from(general!.map((x) => x.toJson())),
        "Fertilization": fertilization == null
            ? []
            : List<dynamic>.from(fertilization!.map((x) => x.toJson())),
        "Valve defaults": valveDefaults == null
            ? []
            : List<dynamic>.from(valveDefaults!.map((x) => x.toJson())),
        "Memory allocations": memoryAllocations == null
            ? []
            : List<dynamic>.from(memoryAllocations!.map((x) => x.toJson())),
      };
}

class DealerDefinitionValue {
  int? dealerDefinitionId;
  String? parameter;
  String? description;
  String? type;
  String? dropdownValues;
  int? categoryId;
  String? categoryName;
  String? active;

  DealerDefinitionValue({
    this.dealerDefinitionId,
    this.parameter,
    this.description,
    this.type,
    this.dropdownValues,
    this.categoryId,
    this.categoryName,
    this.active,
  });

  factory DealerDefinitionValue.fromJson(Map<String, dynamic> json) =>
      DealerDefinitionValue(
        dealerDefinitionId: json["dealerDefinitionId"],
        parameter: json["parameter"],
        description: json["description"],
        type: json["type"],
        dropdownValues: json["dropdownValues"],
        categoryId: json["categoryId"],
        categoryName: json["categoryName"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "dealerDefinitionId": dealerDefinitionId,
        "parameter": parameter,
        "description": description,
        "type": type,
        "dropdownValues": dropdownValues,
        "categoryId": categoryId,
        "categoryName": categoryName,
        "active": active,
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
