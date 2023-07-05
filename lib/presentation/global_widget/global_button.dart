import 'package:flutter/material.dart';

class GlobalButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final Color color;
  final Color colorText;
  final double height;
  final double width;
  final double? raduis;

  const GlobalButton({
    super.key,
    this.onPressed,
    this.raduis,
    required this.text,
    required this.color,
    required this.height,
    required this.width,
    required this.colorText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed ?? () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(raduis ?? 18),
          ),
          backgroundColor: color,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 13.08,
              fontWeight: FontWeight.w400,
              color: colorText,
            ),
          ),
        ),
      ),
    );
  }
}
