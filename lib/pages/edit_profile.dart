import 'dart:io';

import 'package:alobhatechnologies/constants/app_color.dart';
import 'package:alobhatechnologies/constants/app_font_size.dart';
import 'package:alobhatechnologies/controller/auth_controller.dart';
import 'package:alobhatechnologies/widget/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({
    super.key,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstnametextEditingController =
      TextEditingController();
  TextEditingController lastnametextEditingController = TextEditingController();
  TextEditingController emailtextEditingController = TextEditingController();
  TextEditingController mobiletextEditingController = TextEditingController();
  TextEditingController addresstextEditingController = TextEditingController();
  TextEditingController dobtextEditingController = TextEditingController();
  DateTime? _selectedDate;
  String? genderDropdownvalue;
  AuthController authController = Get.put(AuthController());
  List<String> genderItems = [
    'Male',
    'Female',
  ];

  @override
  void initState() {
    super.initState();
  }

  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimary,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: white,
            )),
        title:
            text("Edit profile", textColor: white, fontWeight: FontWeight.w700),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(height: 24),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 28,
                  width: double.infinity,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () async {
                      final XFile? image =
                          await _picker.pickImage(source: ImageSource.gallery);
                      setState(() {
                        _image = image;
                      });
                      // uplodeImage(File(_image!.path));
                    },
                    child: Container(
                      height: 140,
                      width: 140,
                      decoration: BoxDecoration(
                        color: whiteSecondery,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                        border: Border.all(color: colorPrimaryLight, width: 4),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(80)),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: _image == null
                            ? Image.network(
                                "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Default_pfp.svg/340px-Default_pfp.svg.png",
                                fit: BoxFit.fill,
                              )
                            : Image.file(
                                File(_image!.path),
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 28,
                  width: double.infinity,
                ),
                SizedBox(
                  width: 315,
                  child: CustomTextFormField(
                    mController: firstnametextEditingController,
                    text: "First Name",
                    textColor: textColorSecondary,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 315,
                  child: CustomTextFormField(
                    mController: lastnametextEditingController,
                    text: "Last Name",
                    textColor: textColorSecondary,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 315,
                  child: CustomTextFormField(
                    mController: emailtextEditingController,
                    text: "Email",
                    textColor: textColorSecondary,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 315,
                  child: CustomTextFormField(
                    mController: mobiletextEditingController,
                    text: "Phone",
                    textColor: textColorSecondary,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: 315,
                  decoration: BoxDecoration(
                      color: colorPrimaryLight,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12.0)),
                      border: Border.all(color: colorPrimaryLight)),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your dob';
                      }
                      return null;
                    },
                    onTap: () {
                      _selectDate(context);
                    },
                    keyboardType: TextInputType.none,
                    readOnly: true,
                    controller: dobtextEditingController,
                    decoration: InputDecoration(
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      contentPadding: const EdgeInsets.fromLTRB(16, 15, 4, 8),
                      hintText: "Birthdate",
                      hintStyle: const TextStyle(
                          color: textColorSecondary, fontSize: textSizeMedium),
                      // labelText: widget.text,
                      enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 0.0,
                        ),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                              color: Colors.transparent, width: 0.0)),
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                            color: Colors.transparent, width: 0.0),
                      ),
                    ),
                    maxLines: 1,
                    style: const TextStyle(
                        color: textColorSecondary, fontSize: textSizeMedium),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: 315,
                  decoration: BoxDecoration(
                      color: colorPrimaryLight,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12.0)),
                      border: Border.all(color: colorPrimaryLight)),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      contentPadding: const EdgeInsets.fromLTRB(16, 15, 4, 8),
                      hintText: "Gender",
                      hintStyle: const TextStyle(
                          color: textColorSecondary, fontSize: textSizeMedium),
                      // labelText: widget.text,
                      enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 0.0,
                        ),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                              color: Colors.transparent, width: 0.0)),
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                            color: Colors.transparent, width: 0.0),
                      ),
                    ),
                    style: const TextStyle(
                        color: textColorSecondary, fontSize: textSizeMedium),
                    value: genderDropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: genderItems.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        genderDropdownvalue = newValue!;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 315,
                  child: CustomTextFormField(
                    mController: addresstextEditingController,
                    text: "Address",
                    textColor: textColorSecondary,
                    maxLine: 5,
                  ),
                ),
                const SizedBox(height: 24),
                MainAppButton(
                  buttonColor: colorPrimary,
                  onTap: () {
                    if (_formKey.currentState!.validate() && _image != null) {
                      authController
                          .updateUser(
                              firstName: firstnametextEditingController.text,
                              lastName: lastnametextEditingController.text,
                              email: emailtextEditingController.text,
                              mobile: mobiletextEditingController.text,
                              gender: genderDropdownvalue ?? "",
                              dob: _selectedDate!.toIso8601String(),
                              address: addresstextEditingController.text,
                              file: File(_image!.path))
                          .then((value) {
                        Get.snackbar(
                          value.code!,
                          value.message!,
                          colorText: white,
                          backgroundColor: colorPrimary,
                          icon: const Icon(Icons.close_rounded,
                              color: Colors.white),
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      });
                    }
                  },
                  height: 54,
                  width: 315,
                  text: "Save Now",
                  textColor: white,
                ),
                const SizedBox(height: 28),
              ],
            ),
          ),
        ],
      )),
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate != null ? _selectedDate! : DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: const ColorScheme.light(
                primary: colorPrimary,
                onPrimary: Colors.white,
                surface: colorPrimary,
              ),
              dialogBackgroundColor: appbackground,
            ),
            child: child!,
          );
        });
    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      dobtextEditingController
        ..text = DateFormat.yMMMd().format(_selectedDate!)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: dobtextEditingController.text.length,
            affinity: TextAffinity.upstream));
    }
  }
}
