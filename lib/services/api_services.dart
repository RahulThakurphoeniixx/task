import 'dart:convert';
import 'dart:io';
import 'package:alobhatechnologies/models/login_model.dart';
import 'package:alobhatechnologies/models/product_data_model.dart';
import 'package:alobhatechnologies/models/user_model.dart';
import 'package:alobhatechnologies/services/api_constent.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiServices {
  static Future<LoginModelModel> userRegister(
      {required String emailMobile, required String type}) async {
    String url = baseUrl + register;
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields.addAll({'email_mobile': emailMobile, 'type': type});
    http.StreamedResponse response = await request.send();
    dynamic data = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      return LoginModelModel.fromJson(jsonDecode(data));
    } else {
      print(response.reasonPhrase);
      return LoginModelModel(
          code: response.statusCode.toString(),
          message: response.reasonPhrase!,
          data: null);
    }
  }

  static Future<UserModel> otp(
      {required String userId, required String txtotp}) async {
    var request = http.Request(
        'POST', Uri.parse('$baseUrl$verifyOtp?user_id=$userId&otp=$txtotp'));
    http.StreamedResponse response = await request.send();
    dynamic data = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(data));
    } else {
      print(response.reasonPhrase);
      return UserModel(
          code: response.statusCode.toString(),
          message: response.reasonPhrase!,
          data: null);
    }
  }

  static Future<UserModel> editUser(
      {required String firstName,
      required String lastName,
      required String email,
      required String mobile,
      required String gender,
      required String dob,
      required String address,
      required File file}) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("api_token");
    String? userId = prefs.getString("user_id");
    var headers = {'id': userId!, 'Authorization': token!};
    String url = baseUrl + editUserProfile;
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields.addAll({
      'user_id': userId,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'mobile': mobile,
      'gender': gender,
      'dob': dob,
      'address': address
    });
    request.files
        .add(await http.MultipartFile.fromPath('profileImage', file.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    dynamic data = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(data));
    } else {
      print(response.reasonPhrase);
      return UserModel(
          code: response.statusCode.toString(),
          message: response.reasonPhrase!,
          data: null);
    }
  }

  static Future<ProductsDataModel> getProductData(
      {required String pageUrl}) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("api_token");
    String? userId = prefs.getString("user_id");
    var headers = {'id': userId!, 'Authorization': token!};
    var request = http.MultipartRequest('POST', Uri.parse(pageUrl));
    request.fields
        .addAll({'main_category': '1', 'subcategory': '2', 'type': 'normal'});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    dynamic data = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      return ProductsDataModel.fromJson(jsonDecode(data));
    } else {
      print(response.reasonPhrase);
      return ProductsDataModel(
          code: response.statusCode.toString(),
          message: response.reasonPhrase!,
          data: null);
    }
  }
}
