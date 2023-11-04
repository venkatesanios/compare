// // To parse this JSON data, do
// //
// //     final selectionModel = selectionModelFromJson(jsonString);
//
// import 'dart:convert';
//
// SelectionModel selectionModelFromJson(String str) => SelectionModel.fromJson(json.decode(str));
//
// String selectionModelToJson(SelectionModel data) => json.encode(data.toJson());
//
// class SelectionModel {
//   int? code;
//   String? message;
//   Data? data;
//
//   SelectionModel({
//     this.code,
//     this.message,
//     this.data,
//   });
//
//   factory SelectionModel.fromJson(Map<String, dynamic> json) => SelectionModel(
//     code: json["code"],
//     message: json["message"],
//     data: json["data"] == null ? null : Data.fromJson(json["data"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "code": code,
//     "message": message,
//     "data": data?.toJson(),
//   };
//
//  }
//
// class Data {
//   List<generalData>? mainValve;
//   List<generalData>? irrigationPump;
//   List<generalData>? centralFertilizer;
//   List<generalData>? localFertilizer;
//   List<generalData>? centralFilter;
//   List<generalData>? localFilter;
//
//   Data({
//     this.mainValve,
//     this.irrigationPump,
//     this.centralFertilizer,
//     this.localFertilizer,
//     this.centralFilter,
//     this.localFilter,
//   });
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     mainValve: json["mainValve"] == null ? [] : List<generalData>.from(json["mainValve"]!.map((x) => generalData.fromJson(x))),
//     irrigationPump: json["irrigationPump"] == null ? [] : List<generalData>.from(json["irrigationPump"]!.map((x) => generalData.fromJson(x))),
//     centralFertilizer: json["centralFertilizationSite"] == null ? [] : List<generalData>.from(json["centralFertilizationSite"]!.map((x) => generalData.fromJson(x))),
//     localFertilizer: json["localFertilizer"] == null ? [] : List<generalData>.from(json["localFertilizer"]!.map((x) => generalData.fromJson(x))),
//     centralFilter: json["centralFilterSite"] == null ? [] : List<generalData>.from(json["centralFilterSite"]!.map((x) => generalData.fromJson(x))),
//     localFilter: json["localFilter"] == null ? [] : List<generalData>.from(json["localFilter"]!.map((x) => generalData.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "mainValve": mainValve == null ? [] : List<dynamic>.from(mainValve!.map((x) => x.toJson())),
//     "irrigationPump": irrigationPump == null ? [] : List<dynamic>.from(irrigationPump!.map((x) => x.toJson())),
//     "centralFertilizationSite": centralFertilizer == null ? [] : List<dynamic>.from(centralFertilizer!.map((x) => x.toJson())),
//     "localFertilizer": localFertilizer == null ? [] : List<dynamic>.from(localFertilizer!.map((x) => x.toJson())),
//     "centralFilterSite": centralFilter == null ? [] : List<dynamic>.from(centralFilter!.map((x) => x.toJson())),
//     "localFilter": localFilter == null ? [] : List<dynamic>.from(localFilter!.map((x) => x.toJson())),
//   };
// }
//
// class generalData {
//   int? sNo;
//   String? id;
//   String? location;
//   String? name;
//   bool? selection;
//
//   generalData({
//     this.sNo,
//     this.id,
//     this.location,
//     this.name,
//     this.selection,
//   });
//
//   factory generalData.fromJson(Map<String, dynamic> json) => generalData(
//     sNo: json["sNo"],
//     id: json["id"],
//     location: json["location"],
//     name: json["name"],
//     selection: json["selected"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "sNo": sNo,
//     "id": id,
//     "location": location,
//     "name": name,
//     "selected": selection,
//   };
// }




// To parse this JSON data, do
//
//     final selectionModel = selectionModelFromJson(jsonString);

import 'dart:convert';

SelectionModel selectionModelFromJson(String str) => SelectionModel.fromJson(json.decode(str));

String selectionModelToJson(SelectionModel data) => json.encode(data.toJson());

class SelectionModel {
  int? code;
  String? message;
  Data? data;

  SelectionModel({
    this.code,
    this.message,
    this.data,
  });

  factory SelectionModel.fromJson(Map<String, dynamic> json) => SelectionModel(
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
  List<generalData>? irrigationPump;
  List<generalData>? mainValve;
  List<generalData>? centralFertilizationSite;
  List<generalData>? localFertilizer;
  List<generalData>? centralFilterSite;
  List<generalData>? localFilter;

  Data({
    this.irrigationPump,
    this.mainValve,
    this.centralFertilizationSite,
    this.localFertilizer,
    this.centralFilterSite,
    this.localFilter,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    irrigationPump: json["irrigationPump"] == null ? [] : List<generalData>.from(json["irrigationPump"]!.map((x) => generalData.fromJson(x))),
    mainValve: json["mainValve"] == null ? [] : List<generalData>.from(json["mainValve"]!.map((x) => generalData.fromJson(x))),
    centralFertilizationSite: json["centralFertilizationSite"] == null ? [] : List<generalData>.from(json["centralFertilizationSite"]!.map((x) => generalData.fromJson(x))),
    localFertilizer: json["localFertilizer"] == null ? [] : List<generalData>.from(json["localFertilizer"]!.map((x) => generalData.fromJson(x))),
    centralFilterSite: json["centralFilterSite"] == null ? [] : List<generalData>.from(json["centralFilterSite"]!.map((x) => generalData.fromJson(x))),
    localFilter: json["localFilter"] == null ? [] : List<generalData>.from(json["localFilter"]!.map((x) => generalData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "irrigationPump": irrigationPump == null ? [] : List<dynamic>.from(irrigationPump!.map((x) => x.toJson())),
    "mainValve": mainValve == null ? [] : List<dynamic>.from(mainValve!.map((x) => x.toJson())),
    "centralFertilizationSite": centralFertilizationSite == null ? [] : List<dynamic>.from(centralFertilizationSite!.map((x) => x.toJson())),
    "localFertilizer": localFertilizer == null ? [] : List<dynamic>.from(localFertilizer!.map((x) => x.toJson())),
    "centralFilterSite": centralFilterSite == null ? [] : List<dynamic>.from(centralFilterSite!.map((x) => x.toJson())),
    "localFilter": localFilter == null ? [] : List<dynamic>.from(localFilter!.map((x) => x.toJson())),
  };
}

class generalData {
  int? sNo;
  String? id;
  String? location;
  String? name;
  bool? selected;

  generalData({
    this.sNo,
    this.id,
    this.location,
    this.name,
    this.selected,
  });

  factory generalData.fromJson(Map<String, dynamic> json) => generalData(
    sNo: json["sNo"],
    id: json["id"],
    location: json["location"],
    name: json["name"],
    selected: json["selected"],
  );

  Map<String, dynamic> toJson() => {
    "sNo": sNo,
    "id": id,
    "location": location,
    "name": name,
    "selected": selected,
  };
}
