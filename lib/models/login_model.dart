// To parse this JSON data, do
//
//     final loginModelModel = loginModelModelFromJson(jsonString);

import 'dart:convert';

LoginModelModel loginModelModelFromJson(String str) =>
    LoginModelModel.fromJson(json.decode(str));

String loginModelModelToJson(LoginModelModel data) =>
    json.encode(data.toJson());

class LoginModelModel {
  LoginModelModel({
    this.code,
    this.message,
    this.data,
  });

  String? code;
  String? message;
  Data? data;

  factory LoginModelModel.fromJson(Map<String, dynamic> json) =>
      LoginModelModel(
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.userId,
    this.emailMobile,
    this.type,
    this.otp,
  });

  String? userId;
  String? emailMobile;
  String? type;
  String? otp;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
        emailMobile: json["email_mobile"],
        type: json["type"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "email_mobile": emailMobile,
        "type": type,
        "otp": otp,
      };
}
