import 'package:china_omda/presentation/presentation_managers/exports.dart';

class LangButton extends StatelessWidget {
  final String lang;
  final Function() onTap;
  final Color? color;
  const LangButton({
    super.key,
    required this.lang, required this.onTap, this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          AppStrings.lang.tr(context) == 'English' ? ImageAssets.circleRight : ImageAssets.circleLeft,
        ),
        Positioned(
          top: 0,
          bottom: 0,
          left:  AppStrings.lang.tr(context)  == 'English' ? 2.w : null,
          right:  AppStrings.lang.tr(context)  == 'English' ? null : 2.w,
          child: CircleButton(
            buttonColor:color ,
            onTap: onTap,
            buttonWidget: Text(
              lang,
              style: TextStyle(
                color: ColorManager.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
