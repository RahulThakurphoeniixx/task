import 'package:alobhatechnologies/constants/app_color.dart';
import 'package:alobhatechnologies/constants/app_font_size.dart';
import 'package:alobhatechnologies/controller/auth_controller.dart';
import 'package:alobhatechnologies/models/login_model.dart';
import 'package:alobhatechnologies/pages/home_page.dart';
import 'package:alobhatechnologies/widget/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginOtpVerificationScreen extends StatefulWidget {
  final Data? data;
  const LoginOtpVerificationScreen({super.key, required this.data});

  @override
  State<LoginOtpVerificationScreen> createState() =>
      _LoginOtpVerificationScreenState();
}

class _LoginOtpVerificationScreenState
    extends State<LoginOtpVerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();
  final AuthController _authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 48, left: 16),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_outlined, size: 28),
                    onPressed: () {
                      Get.back();
                    },
                  )),
            ),
            const SizedBox(height: 148),
            Align(
              alignment: Alignment.center,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 28),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 32.0),
                        child: text("OTP",
                            fontSize: textSizeLarge,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(height: 28),
                    SizedBox(
                      width: 315,
                      child: OtpTextField(
                        fieldWidth: 48,
                        numberOfFields: 4,
                        borderColor: colorPrimaryLight,
                        focusedBorderColor: colorPrimaryLight,
                        disabledBorderColor: colorPrimaryLight,
                        showFieldAsBox: true,
                        borderRadius: BorderRadius.circular(10),
                        fillColor: colorPrimaryLight,
                        onCodeChanged: (String code) {},
                        onSubmit: (String verificationOtp) async {
                          setState(() {
                            otpController.text = verificationOtp;
                          });
                        }, // end onSubmit
                      ),
                    ),
                    const SizedBox(height: 30),
                    MainAppButton(
                      buttonColor: colorPrimary,
                      onTap: () async {
                        print(otpController.text);
                        final prefs = await SharedPreferences.getInstance();
                        _authController
                            .otp(
                                userId: widget.data!.userId!,
                                txtotp: otpController.text)
                            .then((value) async {
                          print(value.data!.apiToken!);
                          prefs.setString("user_id", value.data!.userId!);
                          prefs.setString("api_token", value.data!.apiToken!);
                          Get.offAll(const MyHomePage());
                        });
                      },
                      height: 54,
                      width: 315,
                      text: "Login Now",
                      textColor: white,
                    ),
                    const SizedBox(height: 48),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
