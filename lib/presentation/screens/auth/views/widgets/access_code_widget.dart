import 'package:china_omda/presentation/presentation_managers/exports.dart';

class AccessCodeWidget extends StatelessWidget {
  final List<TextEditingController> controllers;
  final Color? focusedColor;
  final Color? enabledColor;
  final Color? borderColor;
  final bool? filled;
  final Color? fillColor;

  const AccessCodeWidget({
    Key? key,
    required this.controllers,
    this.focusedColor,
    this.enabledColor,
    this.borderColor,
    this.filled,
    this.fillColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: controllers.map((controller) {
          return GlobalOtpTextFormField(
            controller: controller,
            borderColor: borderColor,
            enabledColor: enabledColor,
            focusedColor: enabledColor,
            filled: filled,
            fillColor: fillColor,
          );
        }).toList(),
      ),
    );
  }
}
