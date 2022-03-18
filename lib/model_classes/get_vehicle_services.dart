//@dart=2.9

import 'dart:convert';

GetVehicleServices getVehicleServicesFromJson(String str) => GetVehicleServices.fromJson(json.decode(str));

String getVehicleServicesToJson(GetVehicleServices data) => json.encode(data.toJson());

class GetVehicleServices {
  GetVehicleServices({
    this.message,
    this.data,
    this.success,
    this.vat_percentage,
  });

  String message;
  List<SingleService> data;
  String success;
  String vat_percentage;

  factory GetVehicleServices.fromJson(Map<String, dynamic> json) => GetVehicleServices(
    message: json["message"],
    vat_percentage: json["vat_percentage"],
    data: List<SingleService>.from(json["data"].map((x) => SingleService.fromJson(x))),
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "vat_percentage": vat_percentage,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "success": success,
  };
}

class SingleService {
  SingleService({
    this.id,
    this.uuid,
    this.name,
    this.nameEn,
    this.vat_value,
    this.nameAr,
    this.price,
    this.priceType,
    this.type,
    this.expectedTime,
    this.typeService,
    this.detailsService,
    this.detailsServiceAr,
    this.discountOffer,
    this.createdBy,
    this.isdeleted,
    this.deletedAt,
    this.deletedBy,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String uuid;
  String name;
  String nameEn;
  String nameAr;
  int price;
  dynamic vat_value;
  String priceType;
  int type;
  int expectedTime;
  String typeService;
  String detailsService;
  dynamic detailsServiceAr;
  int discountOffer;
  int createdBy;
  int isdeleted;
  dynamic deletedAt;
  dynamic deletedBy;
  String createdAt;
  String updatedAt;

  factory SingleService.fromJson(Map<String, dynamic> json) => SingleService(
    id: json["id"],
    uuid: json["uuid"],
    name: json["name"],
    vat_value: json["vat_value"],
    nameEn: json["name_en"],
    nameAr: json["name_ar"],
    price: json["price"],
    priceType: json["price_type"],
    type: json["type"] == null ? null : json["type"],
    expectedTime: json["expected_time"],
    typeService: json["type_service"],
    detailsService: json["details_service"] == null ? null : json["details_service"],
    detailsServiceAr: json["details_service_ar"],
    discountOffer: json["discount_offer"] == null ? null : json["discount_offer"],
    createdBy: json["created_by"] == null ? null : json["created_by"],
    isdeleted: json["isdeleted"],
    deletedAt: json["deleted_at"],
    deletedBy: json["deleted_by"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"] == null ? null : json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "uuid": uuid,
    "name": name,
    "name_en": nameEn,
    "name_ar": nameAr,
    "vat_value": vat_value,
    "price": price,
    "price_type": priceType,
    "type": type == null ? null : type,
    "expected_time": expectedTime,
    "type_service": typeService,
    "details_service": detailsService == null ? null : detailsService,
    "details_service_ar": detailsServiceAr,
    "discount_offer": discountOffer == null ? null : discountOffer,
    "created_by": createdBy == null ? null : createdBy,
    "isdeleted": isdeleted,
    "deleted_at": deletedAt,
    "deleted_by": deletedBy,
    "created_at": createdAt,
    "updated_at": updatedAt == null ? null : updatedAt,
  };
}
