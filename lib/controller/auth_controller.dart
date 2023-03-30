import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:alobhatechnologies/models/login_model.dart';
import 'package:alobhatechnologies/models/product_data_model.dart';
import 'package:alobhatechnologies/models/user_model.dart';
import 'package:alobhatechnologies/services/api_constent.dart';
import 'package:get/get.dart';

import '../services/api_services.dart';

class AuthController extends GetxController {
  RxBool loginSendOtpLoding = false.obs;
  RxBool loginOtpVerifyLoding = false.obs;
  RxBool updateUserLoding = false.obs;

  @override
  void onInit() {
    getProductData(pageUrl: baseUrl + getProducts);
    super.onInit();
  }

  Future<LoginModelModel> register(
      {required String emailMobile, required String type}) async {
    loginSendOtpLoding(true);
    LoginModelModel response =
        await ApiServices.userRegister(emailMobile: emailMobile, type: type)
            .catchError((error, stackTrace) => log(error));
    loginSendOtpLoding(false);
    return response;
  }

  Future<UserModel> otp(
      {required String userId, required String txtotp}) async {
    loginOtpVerifyLoding(true);
    UserModel response = await ApiServices.otp(userId: userId, txtotp: txtotp)
        .catchError((error, stackTrace) => log(error));
    loginOtpVerifyLoding(false);
    return response;
  }

  Future<UserModel> updateUser(
      {required String firstName,
      required String lastName,
      required String email,
      required String mobile,
      required String gender,
      required String dob,
      required String address,
      required File file}) async {
    updateUserLoding(true);
    UserModel response = await ApiServices.editUser(
            firstName: firstName,
            lastName: lastName,
            email: email,
            mobile: mobile,
            gender: gender,
            dob: dob,
            address: address,
            file: file)
        .catchError((error, stackTrace) => log(error));
    updateUserLoding(false);
    return response;
  }

  RxString productnextPageUrl = "".obs;
  var productLoding = true.obs;
  ProductsDataModel? _productsDataModel;
  RxList<dynamic> productdataList = [].obs;
  ProductsDataModel? get mProductListData => _productsDataModel;

  Future<void> getProductData({String? pageUrl, bool isPaginatHit = false}) {
    return ApiServices.getProductData(pageUrl: pageUrl!)
        .then((ProductsDataModel? response) {
      productLoding(true);
      _productsDataModel = response!;
      productnextPageUrl(response.data!.pagination!.nextPageUrl ?? "");
      if (!isPaginatHit) {
        productdataList.clear();
      }
      for (var element in _productsDataModel!.data!.products!) {
        productdataList.add(element);
      }
    }).catchError((err) {
      log(err, name: "Booking API", time: DateTime.now(), zone: Zone.current);
      return err;
    }).whenComplete(() => productLoding(false));
  }
}
