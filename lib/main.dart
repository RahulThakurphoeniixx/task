import 'package:alobhatechnologies/pages/welcom_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toast/toast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return GetMaterialApp(
      title: 'Alobha Technologies',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const WelcomPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
