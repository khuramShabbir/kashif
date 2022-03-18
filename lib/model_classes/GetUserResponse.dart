//@dart=2.9

import 'dart:convert';

GetUserResponse getUserResponseFromJson(String str) => GetUserResponse.fromJson(json.decode(str));

String getUserResponseToJson(GetUserResponse data) => json.encode(data.toJson());

class GetUserResponse {
  GetUserResponse({
    this.message,
    this.accessToken,
    this.user,
    this.success,
  });

  String message;
  String accessToken;
  User user;
  String success;

  factory GetUserResponse.fromJson(Map<String, dynamic> json) => GetUserResponse(
    message: json["message"],
    accessToken: json["access_token"],
    user: User.fromJson(json["user"]),
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "access_token": accessToken,
    "user": user.toJson(),
    "success": success,
  };
}

class User {
  User({
    this.id,
    this.uuid,
    this.name,
    this.nameEn,
    this.nameAr,
    this.username,
    this.email,
    this.mobile,
    this.maxDiscountMember,
    this.maxDiscountService,
    this.maxDiscountParts,
    this.jobTitle,
    this.vmBranchId,
    this.isdeleted,
    this.currentTeamId,
    this.profilePhotoPath,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.deletedBy,
    this.getNotify,
    this.inspectionNotify,
    this.profilePhotoUrl,
  });

  int id;
  dynamic uuid;
  String name;
  String nameEn;
  String nameAr;
  dynamic username;
  String email;
  int mobile;
  int maxDiscountMember;
  dynamic maxDiscountService;
  dynamic maxDiscountParts;
  dynamic jobTitle;
  dynamic vmBranchId;
  int isdeleted;
  dynamic currentTeamId;
  dynamic profilePhotoPath;
  dynamic createdBy;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  dynamic deletedBy;
  int getNotify;
  int inspectionNotify;
  String profilePhotoUrl;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    uuid: json["uuid"],
    name: json["name"],
    nameEn: json["name_en"],
    nameAr: json["name_ar"],
    username: json["username"],
    email: json["email"],
    mobile: json["mobile"],
    maxDiscountMember: json["max_discount_member"],
    maxDiscountService: json["max_discount_service"],
    maxDiscountParts: json["max_discount_parts"],
    jobTitle: json["job_title"],
    vmBranchId: json["vm_branch_id"],
    isdeleted: json["isdeleted"],
    currentTeamId: json["current_team_id"],
    profilePhotoPath: json["profile_photo_path"],
    createdBy: json["created_by"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    deletedBy: json["deleted_by"],
    getNotify: json["get_notify"],
    inspectionNotify: json["inspection_notify"],
    profilePhotoUrl: json["profile_photo_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "uuid": uuid,
    "name": name,
    "name_en": nameEn,
    "name_ar": nameAr,
    "username": username,
    "email": email,
    "mobile": mobile,
    "max_discount_member": maxDiscountMember,
    "max_discount_service": maxDiscountService,
    "max_discount_parts": maxDiscountParts,
    "job_title": jobTitle,
    "vm_branch_id": vmBranchId,
    "isdeleted": isdeleted,
    "current_team_id": currentTeamId,
    "profile_photo_path": profilePhotoPath,
    "created_by": createdBy,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
    "deleted_by": deletedBy,
    "get_notify": getNotify,
    "inspection_notify": inspectionNotify,
    "profile_photo_url": profilePhotoUrl,
  };
}
