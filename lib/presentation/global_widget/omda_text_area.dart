import 'package:china_omda/app/app_lang.dart';
import 'package:china_omda/presentation/presentation_managers/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OmdaTextArea extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Color? contentTextColor;
  final bool? enabled;
  final String lableText;
  final double? height;
  final double? width;

  const OmdaTextArea({
    super.key,
    this.controller,
    this.keyboardType,
    this.contentTextColor,
    this.enabled,
    this.height,
    this.width,
    required this.lableText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 3,
      controller: controller,
      keyboardType: keyboardType,
      textAlign: TextAlign.center,
      cursorColor: ColorManager.primary,
      style: TextStyle(
        color: contentTextColor ?? ColorManager.text,
      ),
      decoration: InputDecoration(
        enabled: enabled ?? false,
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.primary),
        ),
        floatingLabelAlignment: FloatingLabelAlignment.center,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: lableText.tr(context),
        labelStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: ColorManager.lableGrey,
        ),
      ),
    );
  }
}
