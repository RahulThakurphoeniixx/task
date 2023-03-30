import 'package:alobhatechnologies/constants/app_color.dart';
import 'package:alobhatechnologies/constants/app_font_size.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget text(String text,
    {var fontSize = textSizeMedium,
    textColor = textColorPrimary,
    var fontWeight = FontWeight.normal,
    var isCentered = false,
    var maxLine = 2,
    var lineThrough = false,
    var latterSpacing = 0.0,
    var textAllCaps = false,
    var isLongText = false}) {
  return Text(textAllCaps ? text.toUpperCase() : text,
      textAlign: isCentered ? TextAlign.center : TextAlign.start,
      maxLines: isLongText ? null : maxLine,
      style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
          decoration:
              lineThrough ? TextDecoration.lineThrough : TextDecoration.none,
          height: 1.5,
          letterSpacing: latterSpacing));
}

class CustomTextFormField extends StatefulWidget {
  final dynamic fontSize;
  final dynamic textColor;
  final dynamic text;
  final dynamic maxLine;
  final Icon? icon;
  final TextEditingController? mController;
  const CustomTextFormField(
      {Key? key,
      var this.fontSize = textSizeMedium,
      var this.textColor = textColorSecondary,
      var this.text = "",
      var this.mController,
      var this.maxLine = 1,
      this.icon})
      : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 62.0,
      decoration: BoxDecoration(
          color: colorPrimaryLight,
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          border: Border.all(color: colorPrimaryLight)),
      child: TextFormField(
        controller: widget.mController,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter your ${widget.text}';
          }
          return null;
        },
        decoration: InputDecoration(
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          prefixIcon: widget.icon,
          contentPadding: const EdgeInsets.fromLTRB(16, 15, 4, 8),
          hintText: widget.text,
          hintStyle: TextStyle(
              color: textColorSecondary,
              fontSize: widget.fontSize),
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
              borderSide:
                  const BorderSide(color: Colors.transparent, width: 0.0)),
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
          ),
        ),
        maxLines: widget.maxLine,
        // maxLength: widget.maxLine,
        style: TextStyle(
            color: textColorSecondary,
            fontSize: widget.fontSize),
      ),
    );
  }

  State<StatefulWidget>? createState() {
    return null;
  }
}


class MainAppButton extends StatefulWidget {
  final String? text;
  final Color? buttonColor;
  final Color? textColor;
  final double? textSize;
  final double? height;
  final double? width;
  final GestureTapCallback? onTap;
  const MainAppButton(
      {super.key,
      this.text,
      this.buttonColor,
      this.textColor,
      this.height,
      this.width,
      this.onTap,
      this.textSize = 18.0});

  @override
  State<MainAppButton> createState() => _MainAppButtonState();
}

class _MainAppButtonState extends State<MainAppButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onTap,
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
              color: widget.buttonColor,
              border: Border.all(
                color: widget.buttonColor!,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(36))),
          child: Center(
              child: text(widget.text ?? "",
                  textColor: widget.textColor,
                  fontSize: widget.textSize)),
        ));
  }
}
