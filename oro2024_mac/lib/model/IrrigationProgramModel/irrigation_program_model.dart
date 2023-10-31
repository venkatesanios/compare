class Program {
  String id;
  int sno;
  Value value;

  Program({required this.id, required this.sno, required this.value});

  factory Program.fromJson(Map<String, dynamic> json) {
   return Program(
       id : json["id"],
       sno : json["sno"],
       value : Value.fromJson(json["value"]));
  }
}

class Value {
  List<dynamic> sequence;
  List<dynamic> schedule;
  List<dynamic> conditions;
  List<dynamic> waterAndFert;
  List<dynamic> selection;
  List<dynamic> alarm;
  List<dynamic> done;

  Value({
    required this.sequence,
    required this.schedule,
    required this.conditions,
    required this.waterAndFert,
    required this.selection,
    required this.alarm,
    required this.done,
  });

  factory Value.fromJson(Map<String, dynamic> json) {
    return Value(
      sequence : json["sequence"],
      schedule : json["schedule"],
      conditions : json["conditions"],
      waterAndFert : json["waterAndFert"],
      selection : json["selection"],
      alarm : json["alarm"],
      done : json["done"],
    );
  }
}

class Devices {
  String? id;
  String? name;
  String? value;

  Devices({
    this.id,
    this.name,
    this.value,
  });

  factory Devices.fromJson(Map<String, dynamic> json) {
    return Devices(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      value: json['value'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'value' : value
    };
  }
}

class Line {
  int sno;
  int id;
  String name;
  List<dynamic> value;

  Line({required this.sno, required this.id, required this.name, required this.value});

  factory Line.fromJson(Map<String, dynamic> json) {
    return Line(
      sno : json["sno"] ?? 0,
      id : json["id"] ?? 0,
      name : json["name"],
      value : json["value"] ?? [],
    );
  }
}

class Group {
  int sno;
  int id;
  String name;
  String location;
  List<dynamic> value;

  Group({required this.sno, required this.id, required this.name, required this.location, required this.value});

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      sno : json["sno"] ?? 0,
      id : json["id"] ?? 0,
      name : json["name"] ?? '',
      location : json["location"] ?? '',
      value : json["value"] ?? [],
    );
  }
}

class Condition {
  String id;
  String name;

  Condition({required this.id, required this.name});

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      id : json["id"] ?? 0,
      name : json["name"] ?? '',
    );
  }
}
