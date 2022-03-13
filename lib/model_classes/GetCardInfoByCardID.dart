//@dart=2.9
// To parse this JSON data, do
//
//     final getCardInfoByCardId = getCardInfoByCardIdFromJson(jsonString);

import 'dart:convert';

GetCardInfoByCardId getCardInfoByCardIdFromJson(String str) => GetCardInfoByCardId.fromJson(json.decode(str));

String getCardInfoByCardIdToJson(GetCardInfoByCardId data) => json.encode(data.toJson());

class GetCardInfoByCardId {
  GetCardInfoByCardId({
    this.success,
    this.message,
    this.data,
  });

  String success;
  String message;
  Data data;

  factory GetCardInfoByCardId.fromJson(Map<String, dynamic> json) => GetCardInfoByCardId(
    success: json["success"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.card,
    this.report,
  });

  Card card;
  Report report;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    card: json["card"]!=null ? Card.fromJson(json["card"]) : null,
    report: json["report"]!=null ? Report.fromJson(json["report"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "card": card.toJson(),
    "report": report.toJson(),
  };
}

class Card {
  Card({
    this.id,
    this.uuid,
    this.inspectionType,
    this.status,
    this.startTime,
    this.endTime,
    this.latitude,
    this.longitude,
    this.card_step,
    this.vmVehicleId,
    this.inspectionStart,
    this.inspectionEnd,
    this.qr_code,
    this.rating,
    this.inspectionTypeText,
    this.createdAt,
    this.vehicle,
    this.invoice,
    this.inspection,
  });

  int id;
  String uuid;
  String inspectionType;
  String status;
  String startTime;
  String endTime;
  String latitude;
  String longitude;
  String qr_code;
  int vmVehicleId;
  String inspectionStart;
  String inspectionEnd;
  dynamic rating;
  dynamic card_step;
  String createdAt;
  String inspectionTypeText;
  Vehicle vehicle;
  Invoice invoice;
  Inspection inspection;

  factory Card.fromJson(Map<String, dynamic> json) => Card(
    id: json["id"],
    uuid: json["uuid"],
    qr_code: json["qr_code"],
    card_step: json["card_step"],
    inspectionType: json["inspection_type"],
    status: json["status"],
    startTime: json["start_time"],
    endTime: json["end_time"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    vmVehicleId: json["vm_vehicle_id"],
    inspectionStart: json["inspection_start"],
    inspectionEnd: json["inspection_end"],
    rating: json["rating"],
    inspectionTypeText: json["inspectionTypeText"],
    createdAt: json["created_at"],
    vehicle: Vehicle.fromJson(json["vehicle"]),
    invoice: Invoice.fromJson(json["invoice"]),
    inspection:json["inspection"] !=null ? Inspection.fromJson(json["inspection"]): null,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "uuid": uuid,
    "qr_code": qr_code,
    "card_step": card_step,
    "inspection_type": inspectionType,
    "status": status,
    "start_time": startTime,
    "end_time": endTime,
    "latitude": latitude,
    "longitude": longitude,
    "vm_vehicle_id": vmVehicleId,
    "inspection_start": inspectionStart,
    "inspection_end": inspectionEnd,
    "rating": rating,
    "inspectionTypeText": inspectionTypeText,
    "created_at": createdAt,
    "vehicle": vehicle.toJson(),
    "invoice": invoice.toJson(),
    "inspection": inspection.toJson(),
  };
}

class Inspection {
  Inspection({
    this.id,
    this.vmAppointmentId,
    this.vmCardId,
    this.lifter,
    this.vehicleCylinder,
    this.vehicleType,
    this.isdeleted,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  dynamic vmAppointmentId;
  int vmCardId;
  dynamic lifter;
  dynamic vehicleCylinder;
  String vehicleType;
  int isdeleted;
  int createdBy;
  String createdAt;
  String updatedAt;

  factory Inspection.fromJson(Map<String, dynamic> json) => Inspection(
    id: json["id"],
    vmAppointmentId: json["vm_appointment_id"],
    vmCardId: json["vm_card_id"],
    lifter: json["lifter"],
    vehicleCylinder: json["vehicle_cylinder"],
    vehicleType: json["vehicle_type"],
    isdeleted: json["isdeleted"],
    createdBy: json["created_by"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "vm_appointment_id": vmAppointmentId,
    "vm_card_id": vmCardId,
    "lifter": lifter,
    "vehicle_cylinder": vehicleCylinder,
    "vehicle_type": vehicleType,
    "isdeleted": isdeleted,
    "created_by": createdBy,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class Invoice {
  Invoice({
    this.id,
    this.vmCardId,
    this.invoiceNumber,
    this.totalPrice,
    this.amountPaid,
    this.paymentMethod,
  });

  int id;
  int vmCardId;
  int invoiceNumber;
  int totalPrice;
  int amountPaid;
  String paymentMethod;

  factory Invoice.fromJson(Map<String, dynamic> json) => Invoice(
    id: json["id"],
    vmCardId: json["vm_card_id"],
    invoiceNumber: json["invoice_number"],
    totalPrice: json["total_price"],
    amountPaid: json["amount_paid"],
    paymentMethod: json["payment_method"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "vm_card_id": vmCardId,
    "invoice_number": invoiceNumber,
    "total_price": totalPrice,
    "amount_paid": amountPaid,
    "payment_method": paymentMethod,
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
  dynamic odo;
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
    odo: json["odo"],
    transmission: json["transmission"],
    vin: json["vin"],
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
    "odo": odo,
    "transmission": transmission,
    "vin": vin,
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

class Report {
  Report({
    this.carBodyChecking,
    this.mechanicalIssue,
    this.report_pdf,
  });

  String carBodyChecking;
  String report_pdf;
  List<MechanicalIssue> mechanicalIssue;

  factory Report.fromJson(Map<String, dynamic> json) => Report(
    carBodyChecking: json["car_body_checking"],
    report_pdf: json["report_pdf"],
    mechanicalIssue: List<MechanicalIssue>.from(json["mechanical_issue"].map((x) => MechanicalIssue.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "car_body_checking": carBodyChecking,
    "report_pdf": report_pdf,
    "mechanical_issue": List<dynamic>.from(mechanicalIssue.map((x) => x.toJson())),
  };
}

class MechanicalIssue {
  MechanicalIssue({
    this.menuName,
    this.menuNameAr,
    this.subIssue,
  });

  String menuName;
  String menuNameAr;
  Map<String, int> subIssue;

  factory MechanicalIssue.fromJson(Map<String, dynamic> json) => MechanicalIssue(
    menuName: json["menu_name"],
    menuNameAr: json["menu_name_ar"],
    subIssue: Map.from(json["subIssue"]).map((k, v) => MapEntry<String, int>(k, v)),
  );

  Map<String, dynamic> toJson() => {
    "menu_name": menuName,
    "menu_name_ar": menuNameAr,
    "subIssue": Map.from(subIssue).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}
