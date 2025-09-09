import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_app/utils/app_styles_roboto.dart';

import '../../utils/app_colors.dart';

typedef OnValidator = String? Function(String?)?;

class CustomTextFormField extends StatefulWidget {
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
  String obscuringCharacter;
  int? maxLines;
  Color? fillColor;
  bool isPassword;
  TextInputFormatter? textInputFormatter;
  TextCapitalization textCapitalization;
  final void Function(String)? onChanged;
  void Function(PointerDownEvent)? onTapOutside;
  Color? cursorColor;

  CustomTextFormField({
    super.key,
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
    this.obscuringCharacter = '*',
    this.maxLines,
    this.isPassword = false,
    this.textInputFormatter,
    this.textCapitalization = TextCapitalization.none,
    this.onChanged,
    this.onTapOutside,
    this.cursorColor,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool isObscure = widget.isPassword;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        errorMaxLines: 2,
        filled: true,
        fillColor: Theme.of(context).cardColor,
        enabledBorder: builtDecorationBorder(
            colorBorderSide: Theme.of(context).hoverColor),
        focusedBorder: builtDecorationBorder(
            colorBorderSide: Theme.of(context).hoverColor),
        errorBorder: builtDecorationBorder(colorBorderSide: AppColors.redColor),
        focusedErrorBorder:
            builtDecorationBorder(colorBorderSide: AppColors.redColor),
        errorStyle:
            AppStylesRoboto.regular14White.copyWith(color: AppColors.redColor),
        hintText: widget.hintText,
        hintStyle: widget.hintStyle ?? Theme.of(context).textTheme.titleMedium,
        labelText: widget.labelText,
        labelStyle: widget.hintStyle ?? Theme.of(context).textTheme.titleMedium,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                icon: Icon(
                  isObscure ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.whiteColor,
                ),
              )
            : null,
      ),
      maxLines: widget.maxLines ?? 1,
      keyboardType: widget.keyboardType,
      obscuringCharacter: widget.obscuringCharacter,
      controller: widget.controller,
      validator: widget.validator,
      style: Theme.of(context).textTheme.titleMedium,
      textCapitalization: widget.textCapitalization,
      textInputAction: TextInputAction.done,
      cursorColor: AppColors.whiteColor,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: isObscure,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onChanged: widget.onChanged,
      inputFormatters: widget.textInputFormatter == null
          ? []
          : [
              widget.textInputFormatter!,
            ],
    );
  }

  OutlineInputBorder builtDecorationBorder({required colorBorderSide}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(width: 1, color: colorBorderSide));
  }
}
