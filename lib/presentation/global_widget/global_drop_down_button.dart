import 'package:china_omda/presentation/presentation_managers/exports.dart';

class GlobalDropDownButton extends StatelessWidget {
  final String? hintText;
  final String? lableText;
  final String? value;
  final double? height;
  final double? width;
  final double? valueSize;
  final bool? filled;
  final Function(String?)? onChanged;
  final List<String>? items;
  final EdgeInsetsGeometry? padding;
  final InputBorder? border;

  const GlobalDropDownButton({
    super.key,
    this.height,
    this.width,
    this.filled,
    this.onChanged,
    this.items,
    this.hintText,
    this.value,
    this.padding,
    this.border,
    this.valueSize,
    this.lableText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 9.0.w),
      child: SizedBox(
        height: height,
        width: width,
        child: DropdownButtonFormField(
          items: items!.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  textAlign: TextAlign.center,
                  value.tr(context),
                  style: TextStyle(
                    fontSize: valueSize ?? 10.sp,
                    height: 1.2,
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: onChanged,
          value: value,
          icon: const SizedBox.shrink(),
          borderRadius: BorderRadius.circular(4),
          isExpanded: true,
          isDense: false,
          alignment: Alignment.center,
          style: const TextStyle(
            fontFamily: 'Cairo',
            color: Colors.black, // Style the selected value color
          ),
          hint: Align(
            alignment: Alignment.center,
            child: Text(
              hintText == null ? '' : hintText!.tr(context),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.sp,
                color: ColorManager.grey1,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          decoration: InputDecoration(
            filled: filled ?? true,
            fillColor: ColorManager.white,
            border: border ??
                OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorManager.primary,
                  ),
                ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorManager.primary,
              ),
            ),

            contentPadding: EdgeInsets.only(right: 8.w),
            floatingLabelAlignment: FloatingLabelAlignment.center,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: ColorManager.lableGrey,
              height: 1,
            ),
            //labelText: lableText,
            label: lableText == null
                ? null
                : Text(
                    lableText ?? '',
                    textAlign: TextAlign.center,
                  ),
            suffixIcon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  ImageAssets.arrowBottom,
                  height: 1.3.h,
                ),
                SvgPicture.asset(
                  ImageAssets.arrowBottom,
                  height: 1.3.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
