import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.suffixIcon,
    this.validator,
    this.textInputType,
    this.onSaved,
    this.prefixIcon,
    required this.obscureText,
    required this.borderSideColor,
    required this.borderRadius,
    required this.fontColor,
    required this.fillcolor,
    required this.textStyleColor,
    required this.fieldSize,
    this.labelText,
    this.labelFontColor,
  });

  final String hintText;
  final TextEditingController controller;
  final dynamic suffixIcon;
  final dynamic prefixIcon;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final void Function(String?)? onSaved;
  final bool obscureText;
  final Color borderSideColor;
  final double borderRadius;
  final Color fontColor;
  final Color fillcolor;
  final Color textStyleColor;
  final double fieldSize;
  final String? labelText;
  final Color? labelFontColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: textStyleColor),
      obscureText: obscureText,
      onSaved: onSaved,
      keyboardType: textInputType,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(fieldSize),
          focusColor: fillcolor,
          hintText: hintText,
          hintStyle: TextStyle(color: fontColor),
          labelText: labelText,
          labelStyle: TextStyle(color: labelFontColor),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          border: InputBorder.none,
          filled: true,
          fillColor: fillcolor,
          focusedBorder: buildOutlineInputBorder(
              borderRadius: borderRadius, borderSide: borderSideColor),
          enabledBorder: buildOutlineInputBorder(
              borderRadius: borderRadius, borderSide: borderSideColor)),
    );
  }

  static OutlineInputBorder buildOutlineInputBorder(
      {required double borderRadius, required Color borderSide}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(color: borderSide));
  }
}
