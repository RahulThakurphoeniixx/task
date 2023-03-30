// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.code,
    this.message,
    this.data,
  });

  String? code;
  String? message;
  UserData? data;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        code: json["code"],
        message: json["message"],
        data: UserData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data!.toJson(),
      };
}

class UserData {
  UserData({
    this.userId,
    this.firstName,
    this.lastName,
    this.email,
    this.mobile,
    this.profileImage,
    this.gender,
    this.dob,
    this.creditPoint,
    this.getNotification,
    this.apiToken,
  });

  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? mobile;
  String? profileImage;
  String? gender;
  String? dob;
  String? creditPoint;
  String? getNotification;
  String? apiToken;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        userId: json["user_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        mobile: json["mobile"],
        profileImage: json["profileImage"],
        gender: json["gender"],
        dob: json["dob"],
        creditPoint: json["credit_point"],
        getNotification: json["get_notification"],
        apiToken: json["api_token"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "mobile": mobile,
        "profileImage": profileImage,
        "gender": gender,
        "dob": dob,
        "credit_point": creditPoint,
        "get_notification": getNotification,
        "api_token": apiToken,
      };
}
