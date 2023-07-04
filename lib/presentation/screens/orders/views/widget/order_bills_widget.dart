import 'package:china_omda/presentation/presentation_managers/exports.dart';

class OrderBillsWidget extends StatelessWidget {
  final Function() onTap;
  const OrderBillsWidget({Key? key, required this.onTap}) : super(key: key);

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
          '17/05/2023',
          style: TextStyle(
              fontSize: 10.sp,
              color: ColorManager.black,
              fontWeight: FontWeight.bold),
        ),
        Text(
          ' رسوم وساطة تجارية',
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 10.sp,
              color: ColorManager.black,
              fontWeight: FontWeight.bold),
        ),
        Text(
          '10000',
          style: TextStyle(
              fontSize: 10.sp,
              color: ColorManager.black,
              fontWeight: FontWeight.bold),
        ),
        Text(
          AppStrings.beenPaid.tr(context),
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
