import 'package:alobhatechnologies/constants/app_color.dart';
import 'package:alobhatechnologies/constants/app_font_size.dart';
import 'package:alobhatechnologies/pages/home_page.dart';
import 'package:alobhatechnologies/pages/login_page.dart';
import 'package:alobhatechnologies/widget/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomPage extends StatefulWidget {
  const WelcomPage({super.key});

  @override
  State<WelcomPage> createState() => _WelcomPageState();
}

class _WelcomPageState extends State<WelcomPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appbackground,
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 148,
              ),
              Column(children: [
                text("Welcome",
                    fontSize: textSizeLarge, fontWeight: FontWeight.w700),
                const SizedBox(
                  height: 4,
                ),
                text("Alobha Technologies",
                    fontSize: textSizeXLarge, fontWeight: FontWeight.w700),
              ]),
              Padding(
                padding: const EdgeInsets.only(bottom: 28.0),
                child: MainAppButton(
                  buttonColor: colorPrimary,
                  onTap: () async {
                    final prefs = await SharedPreferences.getInstance();
                    if (prefs.getString("api_token") != null) {
                      print(prefs.getString("api_token"));
                      Get.offAll(const MyHomePage());
                    } else {
                      Get.offAll(const LoginPage());
                    }
                  },
                  height: 68,
                  width: 295,
                  text: "Get Started",
                  textColor: white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
