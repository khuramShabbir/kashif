// To parse this JSON data, do
//
//     final getVehicleMaker = getVehicleMakerFromJson(jsonString);

import 'dart:convert';

GetVehicleMaker getVehicleMakerFromJson(String str) => GetVehicleMaker.fromJson(json.decode(str));

String getVehicleMakerToJson(GetVehicleMaker data) => json.encode(data.toJson());

class GetVehicleMaker {
  GetVehicleMaker({
    this.message,
    this.data,
    this.success,
  });

  String? message;
  List<Models>? data;
  String? success;

  factory GetVehicleMaker.fromJson(Map<String, dynamic> json) => GetVehicleMaker(
    message: json["message"],
    data: List<Models>.from(json["data"].map((x) => Models.fromJson(x))),
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "success": success,
  };
}

class Models {
  Models({
    this.id,
    this.uuid,
    this.name,
    this.nameEn,
    this.nameAr,
    this.vmVehicleUsers,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.isdeleted,
    this.deletedBy,
    this.deletedAt,
    this.models,
    this.vmVehicleMakes,
    this.vmVehicleMakeId,
  });

  int? id;
  String? uuid;
  String? name;
  String? nameEn;
  String? nameAr;
  int? vmVehicleUsers;
  String? createdAt;
  String? updatedAt;
  int? createdBy;
  int? isdeleted;
  int? deletedBy;
  String? deletedAt;
  List<Models>? models;
  int? vmVehicleMakes;
  int? vmVehicleMakeId;

  factory Models.fromJson(Map<String, dynamic> json) => Models(
    id: json["id"],
    uuid: json["uuid"],
    name: json["name"],
    nameEn: json["name_en"],
    nameAr: json["name_ar"],
    vmVehicleUsers: json["vm_vehicle_users"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"] == null ? null : json["updated_at"],
    createdBy: json["created_by"],
    isdeleted: json["isdeleted"],
    deletedBy: json["deleted_by"] == null ? null : json["deleted_by"],
    deletedAt: json["deleted_at"] == null ? null : json["deleted_at"],
    models: json["models"] == null ? null : List<Models>.from(json["models"].map((x) => Models.fromJson(x))),
    vmVehicleMakes: json["vm_vehicle_makes"] == null ? null : json["vm_vehicle_makes"],
    vmVehicleMakeId: json["vm_vehicle_make_id"] == null ? null : json["vm_vehicle_make_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "uuid": uuid,
    "name": name,
    "name_en": nameEn,
    "name_ar": nameAr,
    "vm_vehicle_users": vmVehicleUsers,
    "created_at": createdAt,
    "updated_at": updatedAt == null ? null : updatedAt,
    "created_by": createdBy,
    "isdeleted": isdeleted,
    "deleted_by": deletedBy == null ? null : deletedBy,
    "deleted_at": deletedAt == null ? null : deletedAt,
    "models": models == null ? null : List<dynamic>.from(models!.map((x) => x.toJson())),
    "vm_vehicle_makes": vmVehicleMakes == null ? null : vmVehicleMakes,
    "vm_vehicle_make_id": vmVehicleMakeId == null ? null : vmVehicleMakeId,
  };
}
