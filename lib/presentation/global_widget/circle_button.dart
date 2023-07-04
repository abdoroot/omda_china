import 'package:china_omda/presentation/presentation_managers/exports.dart';

class CircleButton extends StatelessWidget {
  final Function()? onTap;
  final Color? buttonColor;
  final Widget buttonWidget;

  const CircleButton({
    super.key,
    this.onTap,
    this.buttonColor,
    required this.buttonWidget,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 35,
        backgroundColor: buttonColor ?? ColorManager.secondary,
        child: Center(
          child: buttonWidget,
        ),
      ),
    );
  }
}
