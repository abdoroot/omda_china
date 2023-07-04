import 'package:china_omda/presentation/presentation_managers/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class GlobalTextFormField extends StatelessWidget {
  final TextInputType? textInputType;
  final InputDecoration? decoration;
  final TextEditingController? textController;
  final String? Function(String?)? validator;
  final String? hintText;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? hintStyle;
  final String? vaildMessage;
  final bool? isPassword;
  final Function(String)? onChanged;
  final int? maxChar;
  final bool? enable;
  final Widget? suffixIcon;
  final TextStyle? style;

  const GlobalTextFormField({
    super.key,
    this.enable,
    this.textInputType,
    this.textController,
    this.validator,
    this.vaildMessage,
    this.isPassword,
    this.onChanged,
    this.maxChar,
    this.hintText,
    this.hintStyle,
    this.contentPadding,
    this.suffixIcon,
    this.style, this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 9.w),
      child: TextFormField(
        keyboardType: textInputType ?? TextInputType.text,
        controller: textController,
        textAlign: TextAlign.center,
        cursorColor: ColorManager.primary,
        enabled: enable,
        style: style,
        decoration:decoration?? InputDecoration(
          fillColor: ColorManager.white,
          filled: true,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: hintStyle ??
              TextStyle(
                fontSize: 12.sp,
                color: ColorManager.grey1,
                fontWeight: FontWeight.w700,
              ),
          contentPadding: EdgeInsets.symmetric(vertical: 1.h),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorManager.white)),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorManager.white)),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorManager.white,
            ),
          ),
        ),
        onChanged: onChanged,
        validator: validator ??
            (String? value) {
              if (value!.isEmpty) {
                return vaildMessage ?? 'Please fill this field';
              }
              return null;
            },
        obscureText: isPassword ?? false,
      ),
    );
  }
}
