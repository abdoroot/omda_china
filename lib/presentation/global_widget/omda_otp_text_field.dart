import 'package:china_omda/app/otp.dart';
import 'package:china_omda/presentation/presentation_managers/exports.dart';

class OmdaOtp extends StatelessWidget {
  final Function(String)? onSubmit;

  const OmdaOtp({
    super.key,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.5.w),
        child: OmdaOtpTextField(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            cursorColor: ColorManager.primary,
            showFieldAsBox: true,
            filled: true,
            fillColor: ColorManager.white,
            focusedBorderColor: ColorManager.primary,
            numberOfFields: 4,
            textStyle: const TextStyle(
              height: 1.2,
            ),
            onSubmit: onSubmit),
      ),
    );
  }
}
