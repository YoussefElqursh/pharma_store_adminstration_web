import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store_administration_web/shared/components/functions.dart';

import '../style/colors.dart';

//this is widget use to make stander InputField in app
Widget commonInputField({
  String? txtFileName,
  TextInputType textType = TextInputType.text,
  TextEditingController? controller,
  Icon? prefixIcon,
  IconData? suffixIconData,
  String? suffixIconPth,
  double cursorWidth = 2.0,
  bool isReadOnly = false,
  double? photoHeight,
  double? photoWidth,
  String? hintTxt,
  bool isPassword = false,
  bool isCustomIcon = false,
  String suffixIconCol = black,
  String? label,
  String? Function(String?)? validator,
  VoidCallback? suffixPressed,
}) =>
    TextFormField(
      readOnly: isReadOnly,
      cursorWidth: cursorWidth,
      controller: controller,
      keyboardType: textType,
      obscureText: isPassword,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintTxt,
        labelText: label!,
        labelStyle: TextStyle(
            color: HexColor(white70),
            fontFamily: "Poppins",
            fontWeight: FontWeight.w400,
            fontSize: 14),
        border: const OutlineInputBorder(),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: BorderSide(
              color: HexColor(primary),
              width: 1.0), // Change the color as desired
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: HexColor(bWhite90), width: 1.0),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: isCustomIcon
            ? InkWell(
                onTap: suffixPressed,
                child: Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: setPhoto(
                      kind: 1,
                      path: suffixIconPth,
                      height: photoHeight,
                      width: photoWidth),
                ))
            : IconButton(
                onPressed: suffixPressed,
                icon: Icon(suffixIconData,
                    color: HexColor(suffixIconCol), size: 25),
              ),
      ),
    );
