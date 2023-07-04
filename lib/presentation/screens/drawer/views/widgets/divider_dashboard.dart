import 'package:china_omda/presentation/presentation_managers/exports.dart';

class DividerDashboard extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final Color? colorText;
  const DividerDashboard({Key? key, required this.text,  this.color, this.colorText,  this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 0.1.h,
          width: 32.w,
          color:color ?? ColorManager.black,
        ),
        Text(
          text,
          style:
          TextStyle(fontWeight: FontWeight.bold, fontSize:fontSize?? 15.sp,color: colorText?? ColorManager.black),
        ),
        Container(
          height: 0.1.h,
          width: 32.w,
          color:color?? ColorManager.black,
        ),
      ],
    );
  }
}
