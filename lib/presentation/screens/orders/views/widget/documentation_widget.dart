import 'package:china_omda/presentation/presentation_managers/exports.dart';

class DocumentationWidget extends StatelessWidget {
  final Function() onTap;
  const DocumentationWidget({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '1001',
          style: TextStyle(
              fontSize: 10.sp,
              color: ColorManager.black,
              fontWeight: FontWeight.bold),
        ),
        Text(
          '17/05/20232 08:29 AM',
          style: TextStyle(
              fontSize: 10.sp,
              color: ColorManager.black,
              fontWeight: FontWeight.bold),
        ),
        Text(
          'صورةجوازصورة ',
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 10.sp,
              color: ColorManager.black,
              fontWeight: FontWeight.bold),
        ),
        Text(
          'عمدة \nالصين',
          maxLines: 2,
          style: TextStyle(
              fontSize: 10.sp,
              color: ColorManager.black,
              fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 13.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: ColorManager.primaryGreen,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Icon(
              Icons.remove_red_eye_outlined,
              color: ColorManager.white,
              size: 35,
            ),
          ),
        ),
      ],
    );
  }
}
