// @dart=2.9


import 'dart:convert';

CreateCard createCardFromJson(String str) => CreateCard.fromJson(json.decode(str));

String createCardToJson(CreateCard data) => json.encode(data.toJson());

class CreateCard {
  CreateCard({
    this.message,
    this.data,
    this.success,
  });

  String message;
  CardInfo data;
  String success;

  factory CreateCard.fromJson(Map<String, dynamic> json) => CreateCard(
    message: json["message"],
    data: CardInfo.fromJson(json["data"]),
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data.toJson(),
    "success": success,
  };
}

class CardInfo {
  CardInfo({
    this.uuid,
    this.createStatus,
    this.status,
    this.vmCustomerId,
    this.vmVehicleId,
    this.vmBranchId,
    this.createdBy,
    this.inspectionType,
    this.startTime,
    this.endTime,
    this.latitude,
    this.longitude,
    this.vmMemberId,
    this.memberDisSerRate,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.customer,
    this.vehicle,
  });

  Uuid uuid;
  String createStatus;
  String status;
  int vmCustomerId;
  int vmVehicleId;
  int vmBranchId;
  int createdBy;
  int inspectionType;
  String startTime;
  String endTime;
  String latitude;
  String longitude;
  int vmMemberId;
  int memberDisSerRate;
  String updatedAt;
  String createdAt;
  int id;
  Customer customer;
  Vehicle vehicle;

  factory CardInfo.fromJson(Map<String, dynamic> json) => CardInfo(
    uuid: Uuid.fromJson(json["uuid"]),
    createStatus: json["create_status"],
    status: json["status"],
    vmCustomerId: json["vm_customer_id"],
    vmVehicleId: json["vm_vehicle_id"],
    vmBranchId: json["vm_branch_id"],
    createdBy: json["created_by"],
    inspectionType: json["inspection_type"],
    startTime: json["start_time"],
    endTime: json["end_time"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    vmMemberId: json["vm_member_id"],
    memberDisSerRate: json["member_dis_ser_rate"],
    updatedAt: json["updated_at"],
    createdAt: json["created_at"],
    id: json["id"],
    customer: Customer.fromJson(json["customer"]),
    vehicle: Vehicle.fromJson(json["vehicle"]),
  );

  Map<String, dynamic> toJson() => {
    "uuid": uuid.toJson(),
    "create_status": createStatus,
    "status": status,
    "vm_customer_id": vmCustomerId,
    "vm_vehicle_id": vmVehicleId,
    "vm_branch_id": vmBranchId,
    "created_by": createdBy,
    "inspection_type": inspectionType,
    "start_time": startTime,
    "end_time": endTime,
    "latitude": latitude,
    "longitude": longitude,
    "vm_member_id": vmMemberId,
    "member_dis_ser_rate": memberDisSerRate,
    "updated_at": updatedAt,
    "created_at": createdAt,
    "id": id,
    "customer": customer.toJson(),
    "vehicle": vehicle.toJson(),
  };
}

class Customer {
  Customer({
    this.id,
    this.uuid,
    this.name,
    this.firstname,
    this.middlename,
    this.lastname,
    this.mobile,
    this.email,
    this.memberMarketerCode,
    this.memberMarketerAt,
    this.offerStatus,
    this.isMember,
    this.vmMemberId,
    this.registered,
    this.subscription,
    this.commission,
    this.vmCommissionRatePlanId,
    this.createdBy,
    this.vmVehicleUsers,
    this.rememberToken,
    this.activationLink,
    this.referenceCode,
    this.activationSms,
    this.mobileConfirmed,
    this.isActive,
    this.adminSuspend,
    this.newShareek,
    this.shareekType,
    this.visitSource,
    this.isMarketer,
    this.pointsMarketerId,
    this.idnumber,
    this.isdeleted,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String uuid;
  String name;
  dynamic firstname;
  dynamic middlename;
  dynamic lastname;
  int mobile;
  String email;
  String memberMarketerCode;
  String memberMarketerAt;
  int offerStatus;
  dynamic isMember;
  dynamic vmMemberId;
  int registered;
  int subscription;
  dynamic commission;
  dynamic vmCommissionRatePlanId;
  dynamic createdBy;
  dynamic vmVehicleUsers;
  dynamic rememberToken;
  dynamic activationLink;
  dynamic referenceCode;
  dynamic activationSms;
  int mobileConfirmed;
  int isActive;
  int adminSuspend;
  int newShareek;
  int shareekType;
  String visitSource;
  String isMarketer;
  dynamic pointsMarketerId;
  String idnumber;
  int isdeleted;
  String createdAt;
  String updatedAt;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    id: json["id"],
    uuid: json["uuid"],
    name: json["name"],
    firstname: json["firstname"],
    middlename: json["middlename"],
    lastname: json["lastname"],
    mobile: json["mobile"],
    email: json["email"],
    memberMarketerCode: json["member_marketer_code"],
    memberMarketerAt: json["member_marketer_at"],
    offerStatus: json["offer_status"],
    isMember: json["is_member"],
    vmMemberId: json["vm_member_id"],
    registered: json["registered"],
    subscription: json["subscription"],
    commission: json["commission"],
    vmCommissionRatePlanId: json["vm_commission_rate_plan_id"],
    createdBy: json["created_by"],
    vmVehicleUsers: json["vm_vehicle_users"],
    rememberToken: json["remember_token"],
    activationLink: json["activation_link"],
    referenceCode: json["reference_code"],
    activationSms: json["activation_sms"],
    mobileConfirmed: json["mobile_confirmed"],
    isActive: json["is_active"],
    adminSuspend: json["admin_suspend"],
    newShareek: json["new_shareek"],
    shareekType: json["shareek_type"],
    visitSource: json["visit_source"],
    isMarketer: json["is_marketer"],
    pointsMarketerId: json["points_marketer_id"],
    idnumber: json["idnumber"],
    isdeleted: json["isdeleted"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "uuid": uuid,
    "name": name,
    "firstname": firstname,
    "middlename": middlename,
    "lastname": lastname,
    "mobile": mobile,
    "email": email,
    "member_marketer_code": memberMarketerCode,
    "member_marketer_at": memberMarketerAt,
    "offer_status": offerStatus,
    "is_member": isMember,
    "vm_member_id": vmMemberId,
    "registered": registered,
    "subscription": subscription,
    "commission": commission,
    "vm_commission_rate_plan_id": vmCommissionRatePlanId,
    "created_by": createdBy,
    "vm_vehicle_users": vmVehicleUsers,
    "remember_token": rememberToken,
    "activation_link": activationLink,
    "reference_code": referenceCode,
    "activation_sms": activationSms,
    "mobile_confirmed": mobileConfirmed,
    "is_active": isActive,
    "admin_suspend": adminSuspend,
    "new_shareek": newShareek,
    "shareek_type": shareekType,
    "visit_source": visitSource,
    "is_marketer": isMarketer,
    "points_marketer_id": pointsMarketerId,
    "idnumber": idnumber,
    "isdeleted": isdeleted,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class Uuid {
  Uuid();

  factory Uuid.fromJson(Map<String, dynamic> json) => Uuid(
  );

  Map<String, dynamic> toJson() => {
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
  dynamic vin;
  int vmCustomerId;
  int createdBy;
  int isdeleted;
  String createdAt;
  String updatedAt;

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
  };
}
