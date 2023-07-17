import 'package:china_omda/presentation/presentation_managers/exports.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class OmdaIntlNumber extends StatelessWidget {
  final TextEditingController controller;
  final bool? enabled;
  final bool? filled;
  final String? intialCountryCode;
  final double? padding;
  final Color? borderColor;

  const OmdaIntlNumber({
    super.key,
    required this.controller,
    this.enabled,
    this.intialCountryCode,
    this.padding,
    this.filled,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding ?? 8.w),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: IntlPhoneField(
          autovalidateMode: AutovalidateMode.disabled,
          textAlign: TextAlign.center,
          cursorColor: ColorManager.primary,
          initialCountryCode: intialCountryCode ?? countryCode,
          enabled: enabled ?? true,
          keyboardType: TextInputType.phone,
          validator: (value) {
            if (value.toString().isEmpty) {
              return 'Enter your number';
            }
            return null;
          },
          decoration: InputDecoration(
            counter: const SizedBox.shrink(),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: borderColor ?? Colors.transparent,
              ),
            ),
            constraints: BoxConstraints(
              maxHeight: 8.h,
            ),
            filled: filled ?? true,
            fillColor: ColorManager.white,
            isDense: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: borderColor ?? Colors.transparent,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(style: BorderStyle.none),
            ),
          ),
          languageCode: "en",
          onChanged: (phone) {
            controller.text = phone.completeNumber;
          },
          onCountryChanged: (country) {
            print('Country changed to: ' + country.name);
          },
        ),
      ),
    );
  }
}
