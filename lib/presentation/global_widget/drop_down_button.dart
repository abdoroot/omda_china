import 'package:china_omda/presentation/presentation_managers/exports.dart';

class OmdaDropDownButton extends StatelessWidget {
  final List<DropdownMenuItem<String>>? items;
  final Function(String?)? onChanged;
  final String labelText;
  final bool? filled;
  final Color? fillColor;
  final double? width;
  final double? height;

  const OmdaDropDownButton({
    super.key,
    required this.items,
    required this.onChanged,
    required this.labelText,
    this.filled,
    this.fillColor,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: DropdownButtonFormField<String>(
        value: null,
        decoration: InputDecoration(
          labelText: labelText.tr(context),
          alignLabelWithHint: true,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          labelStyle: const TextStyle(),
          filled: filled ?? false,
          fillColor: fillColor ?? ColorManager.white,
          floatingLabelAlignment: FloatingLabelAlignment.center,
          floatingLabelStyle: TextStyle(color: ColorManager.lableGrey),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFA0A0A0),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorManager.primary,
            ),
          ),
        ),
        onChanged: onChanged,
        icon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              ImageAssets.arrowBottom,
              height: 1.h,
            ),
            SvgPicture.asset(
              ImageAssets.arrowBottom,
              height: 1.h,
            ),
          ],
        ),
        items: items,
      ),
    );
  }
}
