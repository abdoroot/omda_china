import 'package:china_omda/presentation/presentation_managers/exports.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 1.h),
        SvgPicture.asset(
          'assets/images/logo.svg',
          width: 18.w,
          height: 18.h,
        ),
        Text(
          "وسيطك المعتمد للتعاملات التجارية والسياحية",
          style: TextStyle(
            fontSize: 11.27.sp,
            color: ColorManager.brown2,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          "Your approved broker for commercial and tourism transactions",
          style: TextStyle(
            fontSize: 9.5.sp,
            color: ColorManager.brown2,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
