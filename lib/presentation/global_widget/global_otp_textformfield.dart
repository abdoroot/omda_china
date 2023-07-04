import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import '../presentation_managers/color_manager.dart';

class GlobalOtpTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final Function? onChanged;
  final bool? filled;
  final Color? fillColor;
  final Color? focusedColor;
  final Color? enabledColor;
  final Color? borderColor;
  const GlobalOtpTextFormField(
      {Key? key,
      required this.controller,
      this.onChanged,
      this.filled,
      this.fillColor,
       this.focusedColor,
       this.enabledColor,
       this.borderColor,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 15.w,
      height: 5.5.h,
      child: TextField(
        controller: controller,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        cursorColor: ColorManager.primary,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        cursorHeight: 2.8.h,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 4.5.h),
          fillColor: fillColor ?? ColorManager.white,
          filled: filled ?? true,
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: focusedColor?? ColorManager.white)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: enabledColor?? ColorManager.white)),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor?? ColorManager.white,
            ),
          ),
        ),
      ),
    );
  }
}
