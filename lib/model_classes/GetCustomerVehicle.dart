//@dart=2.9

import 'dart:convert';

GetCustomerVehicle getCustomerVehicleFromJson(String str) => GetCustomerVehicle.fromJson(json.decode(str));

String getCustomerVehicleToJson(GetCustomerVehicle data) => json.encode(data.toJson());

class GetCustomerVehicle {
  GetCustomerVehicle({
    this.message,
    this.data,
    this.success,
  });

  String message;
  List<VehicleData> data;
  String success;

  factory GetCustomerVehicle.fromJson(Map<String, dynamic> json) => GetCustomerVehicle(
    message: json["message"],
    data: List<VehicleData>.from(json["data"].map((x) => VehicleData.fromJson(x))),
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "success": success,
  };
}

class VehicleData {
  VehicleData({
    this.id,
    this.make,
    this.model,
    this.year,
    this.plateNumber,
    this.plateChar,
    this.odo,
    this.transmission,
    this.models,
    this.maker,
  });

  int id;
  String make;
  String model;
  int year;
  int plateNumber;
  String plateChar;
  dynamic odo;
  String transmission;
  Maker models;
  Maker maker;

  factory VehicleData.fromJson(Map<String, dynamic> json) => VehicleData(
    id: json["id"],
    make: json["make"],
    model: json["model"],
    year: json["year"],
    plateNumber: json["plate_number"],
    plateChar: json["plate_char"],
    odo: json["odo"],
    transmission: json["transmission"],
    models: Maker.fromJson(json["models"]),
    maker: Maker.fromJson(json["maker"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "make": make,
    "model": model,
    "year": year,
    "plate_number": plateNumber,
    "plate_char": plateChar,
    "odo": odo,
    "transmission": transmission,
    "models": models.toJson(),
    "maker": maker.toJson(),
  };
}

class Maker {
  Maker({
    this.id,
    this.name,
    this.nameEn,
    this.nameAr,
  });

  int id;
  String name;
  String nameEn;
  String nameAr;

  factory Maker.fromJson(Map<String, dynamic> json) => Maker(
    id: json["id"],
    name: json["name"],
    nameEn: json["name_en"],
    nameAr: json["name_ar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "name_en": nameEn,
    "name_ar": nameAr,
  };
}