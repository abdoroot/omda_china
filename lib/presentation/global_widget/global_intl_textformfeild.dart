import 'package:china_omda/presentation/presentation_managers/exports.dart';
import 'package:flutter/cupertino.dart';

class GlobalIntlTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final Color? filledColor;
  final double? horizontal;
  final double? height;
  final double? width;
  final bool? enabled;

  const GlobalIntlTextFormField({
    Key? key,
    this.controller,
    this.filledColor,
    this.height,
    this.width,
    this.enabled,
    this.horizontal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontal ?? 0),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: filledColor,
            border: Border.all(
              color: ColorManager.borderGrey,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          child: InternationalPhoneNumberInput(
            onInputChanged: (PhoneNumber value) {
              controller!.text = value.phoneNumber!;
            },
            isEnabled: enabled ?? true,
            textFieldController: enabled == false ? controller : null,
            initialValue: PhoneNumber(isoCode: countryCode),
            formatInput: false,
            maxLength: 9,
            searchBoxDecoration: InputDecoration(
              labelText: AppStrings.search.tr(context),
              hintText: AppStrings.startTypingSearch.tr(context),
              contentPadding: const EdgeInsets.all(15),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            ),
            keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
            selectorConfig: const SelectorConfig(
              selectorType: PhoneInputSelectorType.DROPDOWN,
              leadingPadding: 0,
              trailingSpace: false,
            ),
            cursorColor: ColorManager.primary,
            inputDecoration: InputDecoration(
              border: InputBorder.none,
              hintText: '- - - - - - - - -',
              prefixIcon: Icon(
                CupertinoIcons.phone,
                color: ColorManager.black,
              ),
              hintStyle: const TextStyle(fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}
