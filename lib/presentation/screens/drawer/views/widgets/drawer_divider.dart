import 'package:china_omda/app/app_lang.dart';
import 'package:china_omda/presentation/presentation_managers/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DrawerDivider extends StatelessWidget {
  final String dividerText;
  final double? fontSize;
  final Color? color;
  final Color? colorText;

  const DrawerDivider({
    super.key,
    required this.dividerText,
    this.color,
    this.colorText,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Divider(
          thickness: 2.0,
          color: ColorManager.primary,
        ),
        Container(
          color: color ?? ColorManager.secondary,
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: Text(
            dividerText.tr(context),
            style: TextStyle(
              color: colorText ?? ColorManager.primary,
            ),
          ),
        ),
      ],
    );
  }
}
