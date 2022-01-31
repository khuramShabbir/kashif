//@dart=2.9

// To parse this JSON data, do
//
//     final getLifters = getLiftersFromJson(jsonString);

import 'dart:convert';

GetLifters getLiftersFromJson(String str) => GetLifters.fromJson(json.decode(str));

String getLiftersToJson(GetLifters data) => json.encode(data.toJson());

class GetLifters {
  GetLifters({
    this.success,
    this.message,
    this.data,
  });

  String success;
  String message;
  List<Data> data;

  factory GetLifters.fromJson(Map<String, dynamic> json) => GetLifters(
    success: json["success"],
    message: json["message"],
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Data {
  Data({
    this.lifterNo,
    this.status,
  });

  int lifterNo;
  String status;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    lifterNo: json["lifter_no"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "lifter_no": lifterNo,
    "status": status,
  };
}
