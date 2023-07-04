import 'package:china_omda/app/app_lang.dart';
import 'package:china_omda/presentation/presentation_managers/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OmdaTextFormFiled extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Color? contentTextColor;
  final bool enabled;
  final String lableText;
  final double? height;
  final double? width;
  final Widget? suffixIcon;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;

  const OmdaTextFormFiled({
    super.key,
    this.controller,
    this.keyboardType,
    this.contentTextColor,
    required this.enabled,
    this.height,
    this.suffixIcon,
    this.width,
    this.onFieldSubmitted,
    this.validator,
    required this.lableText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        textAlign: TextAlign.center,
        cursorColor: ColorManager.primary,
        style: TextStyle(
          color: contentTextColor ?? ColorManager.text,
        ),
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
          enabled: enabled,
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.primary),
          ),
          suffixIcon: suffixIcon,
          floatingLabelAlignment: FloatingLabelAlignment.center,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: Text(
            lableText.tr(context),
            textAlign: TextAlign.center,
          ),
          labelStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: ColorManager.lableGrey,
          ),
        ),
        validator: validator ??
            (value) {
              if (value!.isEmpty) {
                return 'please fill this field';
              }
              return null;
            },
      ),
    );
  }
}
