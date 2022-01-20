// @dart=2.9
// To parse this JSON data, do
//
//     final getUser = getUserFromJson(jsonString);

import 'dart:convert';

GetUser getUserFromJson(String str) => GetUser.fromJson(json.decode(str));

String getUserToJson(GetUser data) => json.encode(data.toJson());

class GetUser {
  GetUser({
    this.message,
    this.success,
    this.data,
  });

  String message;
  String success;
  List<UserInformation> data;

  factory GetUser.fromJson(Map<String, dynamic> json) => GetUser(
    message: json["message"],
    success: json["success"],
    data: List<UserInformation>.from(json["data"].map((x) => UserInformation.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class UserInformation {
  UserInformation({
    this.name,
    this.nameEn,
    this.nameAr,
    this.mobile,
    this.email,
    this.profilePhotoUrl,
  });

  String name;
  String nameEn;
  String nameAr;
  int mobile;
  String email;
  String profilePhotoUrl;

  factory UserInformation.fromJson(Map<String, dynamic> json) => UserInformation(
    name: json["name"],
    nameEn: json["name_en"],
    nameAr: json["name_ar"],
    mobile: json["mobile"],
    email: json["email"],
    profilePhotoUrl: json["profile_photo_url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "name_en": nameEn,
    "name_ar": nameAr,
    "mobile": mobile,
    "email": email,
    "profile_photo_url": profilePhotoUrl,
  };
}
