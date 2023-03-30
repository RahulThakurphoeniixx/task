import 'package:alobhatechnologies/constants/app_color.dart';
import 'package:alobhatechnologies/constants/app_font_size.dart';
import 'package:alobhatechnologies/controller/auth_controller.dart';
import 'package:alobhatechnologies/pages/otp_page.dart';
import 'package:alobhatechnologies/widget/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:toast/toast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthController authController = Get.put(AuthController());
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 200.0),
            text("Login", fontSize: textSizeLarge, fontWeight: FontWeight.w700),
            const SizedBox(height: 48.0),
            CustomTextFormField(
              icon: const Icon(Icons.login),
              mController: textEditingController,
              maxLine: 1,
              fontSize: textSizeMedium,
              text: "Enter email or mobile",
            ),
            const SizedBox(height: 20.0),
            MainAppButton(
              buttonColor: colorPrimary,
              height: 48.0,
              onTap: () {
                if (textEditingController.text.isNotEmpty) {
                  if (isValidEmail(textEditingController.text)) {
                    print("type: email");
                    authController
                        .register(
                            emailMobile: textEditingController.text,
                            type: "email")
                        .then((value) => Get.to(
                            LoginOtpVerificationScreen(data: value.data)));
                  } else if (isValidPhoneNumber(textEditingController.text)) {
                    print("type: mobile");
                    authController
                        .register(
                            emailMobile: textEditingController.text,
                            type: "mobile")
                        .then((value) => Get.to(
                            LoginOtpVerificationScreen(data: value.data)));
                  } else {
                    Get.snackbar(
                      "Wrong input",
                      "Enter valide email or mobile number",
                      colorText: white,
                      backgroundColor: Colors.redAccent,
                      icon:
                          const Icon(Icons.close_rounded, color: Colors.white),
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  }
                } else {
                  Get.snackbar(
                    "Empty input",
                    "Enter email or mobile number first",
                    colorText: white,
                    backgroundColor: Colors.redAccent,
                    icon: const Icon(Icons.close_rounded, color: Colors.white),
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
              },
              text: "Send Otp",
              textColor: white,
              width: double.infinity,
            )
          ],
        ),
      )),
    );
  }

  bool isValidEmail(String? email) =>
      RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
          .hasMatch(email ?? '');

  bool isValidPhoneNumber(String? value) =>
      RegExp(r'(^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$)')
          .hasMatch(value ?? '');
}
