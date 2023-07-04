import 'package:china_omda/presentation/presentation_managers/exports.dart';

class PaymentWidget extends StatelessWidget {
  final String title;
  final String image;
  final Function()? onTap;
  const PaymentWidget({Key? key, required this.title, required this.image, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 14.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: ColorManager.whitGrey,
              offset: const Offset(2, 2),
              blurRadius:5,
            ),
          ],
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 2.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 8.5.sp,
                  color: ColorManager.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 2.w,),
              Image.asset(image),

            ],),
        ),
      ),
    );
  }
}
