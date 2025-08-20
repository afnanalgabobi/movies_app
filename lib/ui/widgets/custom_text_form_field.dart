import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_styles_roboto.dart';

import '../../utils/app_colors.dart';

typedef OnValidator = String? Function(String?)?;

class CustomTextFormField extends StatelessWidget {
  Color? colorBorderSide;
  String? hintText;
  TextStyle? hintStyle;
  String? labelText;
  TextStyle? labelStyle;
  Widget? prefixIcon;
  Widget? suffixIcon;
  OnValidator validator;
  TextEditingController controller;
  TextInputType keyboardType;
  bool obscureText;
  String obscuringCharacter;
  int? maxLines;
  Color? fillColor;

  CustomTextFormField(
      {super.key,
      this.colorBorderSide,
      this.fillColor,
      this.hintText,
      this.hintStyle,
      this.labelText,
      this.labelStyle,
      this.prefixIcon,
      this.suffixIcon,
      this.validator,
      required this.controller,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.obscuringCharacter = '.',
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return TextFormField(
      decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).cardColor,
          enabledBorder: builtDecorationBorder(
              colorBorderSide: Theme.of(context).hoverColor),
          focusedBorder: builtDecorationBorder(
              colorBorderSide: Theme.of(context).hoverColor),
          errorBorder:
              builtDecorationBorder(colorBorderSide: AppColors.redColor),
          focusedErrorBorder:
              builtDecorationBorder(colorBorderSide: AppColors.redColor),
          errorStyle: AppStylesRoboto.regular14White
              .copyWith(color: AppColors.redColor),
          hintText: hintText,
          hintStyle: hintStyle ?? Theme.of(context).textTheme.titleMedium,
          labelText: labelText,
          labelStyle: hintStyle ?? Theme.of(context).textTheme.titleMedium,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon),
      maxLines: maxLines ?? 1,
      keyboardType: keyboardType,
      obscureText: obscureText,
      obscuringCharacter: obscuringCharacter,
      controller: controller,
      validator: validator,
    );
  }

  OutlineInputBorder builtDecorationBorder({required colorBorderSide}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(width: 1, color: colorBorderSide));
  }
}
