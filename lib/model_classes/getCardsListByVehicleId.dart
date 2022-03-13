// @dart=2.9
// To parse this JSON data, do
//
//     final getCardsListByVehicleId = getCardsListByVehicleIdFromJson(jsonString);

import 'dart:convert';

GetCardsListByVehicleId getCardsListByVehicleIdFromJson(String str) => GetCardsListByVehicleId.fromJson(json.decode(str));

String getCardsListByVehicleIdToJson(GetCardsListByVehicleId data) => json.encode(data.toJson());

class GetCardsListByVehicleId {
  GetCardsListByVehicleId({
    this.success,
    this.message,
    this.data,
  });

  String success;
  String message;
  Data data;

  factory GetCardsListByVehicleId.fromJson(Map<String, dynamic> json) => GetCardsListByVehicleId(
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
  });

  List<Card> card;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    card: List<Card>.from(json["card"].map((x) => Card.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "card": List<dynamic>.from(card.map((x) => x.toJson())),
  };
}

class Card {
  Card({
    this.id,
    this.uuid,
    this.vmBranchId,
    this.vmCustomerId,
    this.vmVehicleId,
    this.vmAppointmentId,
    this.lifter,
    this.odo,
    this.vmInvoiceId,
    this.status,
    this.discountService,
    this.servicePrice,
    this.discountParts,
    this.discountServiceRate,
    this.discountPartsRate,
    this.sPrice,
    this.pPrice,
    this.sdPrice,
    this.pdPrice,
    this.disSAmount,
    this.disPAmount,
    this.disMAmount,
    this.disPoints,
    this.partsPrice,
    this.totalDiscount,
    this.totalPrice,
    this.amountPaid,
    this.amount,
    this.amountDue,
    this.vmMemberId,
    this.memberDisSerRate,
    this.memberDisInsRate,
    this.printCount,
    this.offerReport,
    this.technicianChief,
    this.vmOfferCodeId,
    this.commissionCode,
    this.customerFeedback,
    this.customerFeedbackBy,
    this.closedAt,
    this.complictionTimeAt,
    this.createdBy,
    this.isdeleted,
    this.deletedAt,
    this.createStatus,
    this.paymentMethod,
    this.cardStep,
    this.rating,
    this.createdAt,
    this.updatedAt,
    this.deletedBy,
    this.inspectionType,
    this.startTime,
    this.endTime,
    this.latitude,
    this.longitude,
    this.inspectionStart,
    this.inspectionEnd,
    this.inspectionTypeText,
    this.invoice,
  });

  int id;
  String uuid;
  int vmBranchId;
  int vmCustomerId;
  int vmVehicleId;
  dynamic vmAppointmentId;
  dynamic lifter;
  dynamic odo;
  dynamic vmInvoiceId;
  String status;
  dynamic discountService;
  dynamic servicePrice;
  dynamic discountParts;
  int discountServiceRate;
  int discountPartsRate;
  int sPrice;
  int pPrice;
  int sdPrice;
  int pdPrice;
  int disSAmount;
  int disPAmount;
  int disMAmount;
  int disPoints;
  dynamic partsPrice;
  String totalDiscount;
  String totalPrice;
  int amountPaid;
  int amount;
  int amountDue;
  int vmMemberId;
  int memberDisSerRate;
  int memberDisInsRate;
  dynamic printCount;
  dynamic offerReport;
  dynamic technicianChief;
  dynamic vmOfferCodeId;
  dynamic commissionCode;
  dynamic customerFeedback;
  dynamic customerFeedbackBy;
  dynamic closedAt;
  dynamic complictionTimeAt;
  int createdBy;
  int isdeleted;
  dynamic deletedAt;
  String createStatus;
  dynamic paymentMethod;
  dynamic cardStep;
  dynamic rating;
  String createdAt;
  String updatedAt;
  dynamic deletedBy;
  String inspectionType;
  String startTime;
  String endTime;
  String latitude;
  String longitude;
  dynamic inspectionStart;
  dynamic inspectionEnd;
  String inspectionTypeText;
  dynamic invoice;

  factory Card.fromJson(Map<String, dynamic> json) => Card(
    id: json["id"],
    uuid: json["uuid"],
    vmBranchId: json["vm_branch_id"],
    vmCustomerId: json["vm_customer_id"],
    vmVehicleId: json["vm_vehicle_id"],
    vmAppointmentId: json["vm_appointment_id"],
    lifter: json["lifter"],
    odo: json["odo"],
    vmInvoiceId: json["vm_invoice_id"],
    status: json["status"],
    discountService: json["discount_service"],
    servicePrice: json["service_price"],
    discountParts: json["discount_parts"],
    discountServiceRate: json["discount_service_rate"],
    discountPartsRate: json["discount_parts_rate"],
    sPrice: json["s_price"],
    pPrice: json["p_price"],
    sdPrice: json["sd_price"],
    pdPrice: json["pd_price"],
    disSAmount: json["dis_s_amount"],
    disPAmount: json["dis_p_amount"],
    disMAmount: json["dis_m_amount"],
    disPoints: json["dis_points"],
    partsPrice: json["parts_price"],
    totalDiscount: json["total_discount"],
    totalPrice: json["total_price"],
    amountPaid: json["amount_paid"],
    amount: json["amount"],
    amountDue: json["amount_due"],
    vmMemberId: json["vm_member_id"],
    memberDisSerRate: json["member_dis_ser_rate"],
    memberDisInsRate: json["member_dis_ins_rate"],
    printCount: json["print_count"],
    offerReport: json["offer_report"],
    technicianChief: json["technician_chief"],
    vmOfferCodeId: json["vm_offer_code_id"],
    commissionCode: json["commission_code"],
    customerFeedback: json["customer_feedback"],
    customerFeedbackBy: json["customer_feedback_by"],
    closedAt: json["closed_at"],
    complictionTimeAt: json["compliction_time_at"],
    createdBy: json["created_by"],
    isdeleted: json["isdeleted"],
    deletedAt: json["deleted_at"],
    createStatus: json["create_status"],
    paymentMethod: json["payment_method"],
    cardStep: json["card_step"],
    rating: json["rating"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    deletedBy: json["deleted_by"],
    inspectionType: json["inspection_type"],
    startTime: json["start_time"],
    endTime: json["end_time"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    inspectionStart: json["inspection_start"],
    inspectionEnd: json["inspection_end"],
    inspectionTypeText: json["inspectionTypeText"],
    invoice: json["invoice"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "uuid": uuid,
    "vm_branch_id": vmBranchId,
    "vm_customer_id": vmCustomerId,
    "vm_vehicle_id": vmVehicleId,
    "vm_appointment_id": vmAppointmentId,
    "lifter": lifter,
    "odo": odo,
    "vm_invoice_id": vmInvoiceId,
    "status": status,
    "discount_service": discountService,
    "service_price": servicePrice,
    "discount_parts": discountParts,
    "discount_service_rate": discountServiceRate,
    "discount_parts_rate": discountPartsRate,
    "s_price": sPrice,
    "p_price": pPrice,
    "sd_price": sdPrice,
    "pd_price": pdPrice,
    "dis_s_amount": disSAmount,
    "dis_p_amount": disPAmount,
    "dis_m_amount": disMAmount,
    "dis_points": disPoints,
    "parts_price": partsPrice,
    "total_discount": totalDiscount,
    "total_price": totalPrice,
    "amount_paid": amountPaid,
    "amount": amount,
    "amount_due": amountDue,
    "vm_member_id": vmMemberId,
    "member_dis_ser_rate": memberDisSerRate,
    "member_dis_ins_rate": memberDisInsRate,
    "print_count": printCount,
    "offer_report": offerReport,
    "technician_chief": technicianChief,
    "vm_offer_code_id": vmOfferCodeId,
    "commission_code": commissionCode,
    "customer_feedback": customerFeedback,
    "customer_feedback_by": customerFeedbackBy,
    "closed_at": closedAt,
    "compliction_time_at": complictionTimeAt,
    "created_by": createdBy,
    "isdeleted": isdeleted,
    "deleted_at": deletedAt,
    "create_status": createStatus,
    "payment_method": paymentMethod,
    "card_step": cardStep,
    "rating": rating,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "deleted_by": deletedBy,
    "inspection_type": inspectionType,
    "start_time": startTime,
    "end_time": endTime,
    "latitude": latitude,
    "longitude": longitude,
    "inspection_start": inspectionStart,
    "inspection_end": inspectionEnd,
    "inspectionTypeText": inspectionTypeText,
    "invoice": invoice,
  };
}
