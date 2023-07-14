import 'package:china_omda/presentation/presentation_managers/exports.dart';

class GlobalButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final Color color;
  final Color colorText;
  final double height;
  final double width;
  final double? raduis;
  final double? fontSize;

  const GlobalButton({
    super.key,
    this.onPressed,
    this.raduis,
    this.fontSize,
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
            textAlign: TextAlign.center,
            maxLines: 1,
            style: TextStyle(
              fontSize: fontSize ?? 13.sp,
              fontWeight: FontWeight.w400,
              color: colorText,
            ),
          ),
        ),
      ),
    );
  }
}
