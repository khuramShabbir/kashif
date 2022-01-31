//@dart=2.9

import 'dart:convert';

GetAllRecords getAllRecordsFromJson(String str) => GetAllRecords.fromJson(json.decode(str));

String getAllRecordsToJson(GetAllRecords data) => json.encode(data.toJson());

class GetAllRecords {
  GetAllRecords({
    this.message,
    this.data,
    this.success,
  });

  String message;
  List<RecodsData> data;
  String success;

  factory GetAllRecords.fromJson(Map<String, dynamic> json) => GetAllRecords(
    message: json["message"],
    data: List<RecodsData>.from(json["data"].map((x) => RecodsData.fromJson(x))),
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "success": success,
  };
}

class RecodsData {
  RecodsData({
    this.id,
    this.inspectionType,
    this.status,
    this.startTime,
    this.endTime,
    this.latitude,
    this.longitude,
    this.vmVehicleId,
    this.vehicle,
  });

  int id;
  String inspectionType;
  String status;
  String startTime;
  String endTime;
  String latitude;
  String longitude;
  int vmVehicleId;
  Vehicle vehicle;

  factory RecodsData.fromJson(Map<String, dynamic> json) => RecodsData(
    id: json["id"],
    inspectionType: json["inspection_type"],
    status: json["status"],
    startTime: json["start_time"],
    endTime: json["end_time"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    vmVehicleId: json["vm_vehicle_id"],
    vehicle: Vehicle.fromJson(json["vehicle"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "inspection_type": inspectionType,
    "status": status,
    "start_time": startTime,
    "end_time": endTime,
    "latitude": latitude,
    "longitude": longitude,
    "vm_vehicle_id": vmVehicleId,
    "vehicle": vehicle.toJson(),
  };
}

class Vehicle {
  Vehicle({
    this.id,
    this.uuid,
    this.make,
    this.model,
    this.year,
    this.plateNumber,
    this.plateChar,
    this.odo,
    this.transmission,
    this.vin,
    this.vmCustomerId,
    this.createdBy,
    this.isdeleted,
    this.createdAt,
    this.updatedAt,
    this.models,
    this.maker,
  });

  int id;
  String uuid;
  String make;
  String model;
  int year;
  int plateNumber;
  String plateChar;
  int odo;
  String transmission;
  String vin;
  int vmCustomerId;
  int createdBy;
  int isdeleted;
  String createdAt;
  String updatedAt;
  Maker models;
  Maker maker;

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
    id: json["id"],
    uuid: json["uuid"],
    make: json["make"],
    model: json["model"],
    year: json["year"],
    plateNumber: json["plate_number"],
    plateChar: json["plate_char"],
    odo: json["odo"] == null ? null : json["odo"],
    transmission: json["transmission"],
    vin: json["vin"] == null ? null : json["vin"],
    vmCustomerId: json["vm_customer_id"],
    createdBy: json["created_by"],
    isdeleted: json["isdeleted"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    models: Maker.fromJson(json["models"]),
    maker: Maker.fromJson(json["maker"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "uuid": uuid,
    "make": make,
    "model": model,
    "year": year,
    "plate_number": plateNumber,
    "plate_char": plateChar,
    "odo": odo == null ? null : odo,
    "transmission": transmission,
    "vin": vin == null ? null : vin,
    "vm_customer_id": vmCustomerId,
    "created_by": createdBy,
    "isdeleted": isdeleted,
    "created_at": createdAt,
    "updated_at": updatedAt,
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
