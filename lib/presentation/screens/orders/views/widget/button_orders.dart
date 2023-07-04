import 'package:china_omda/presentation/presentation_managers/exports.dart';

class ButtonOrders extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final Color color;
  final Color colorText;
  final double height;
  final double? width;

  const ButtonOrders({
    Key? key,
    this.onTap,
    required this.text,
    required this.color,
    required this.colorText,
    required this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 16.4.w,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 11.5.sp,
            fontWeight: FontWeight.w500,
            color: colorText,
          ),
        ),
      ),
    );
  }
}
