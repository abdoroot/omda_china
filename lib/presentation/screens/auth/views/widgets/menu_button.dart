import 'package:china_omda/presentation/presentation_managers/exports.dart';

class MenuButton extends StatelessWidget {
  final String lang;
  const MenuButton({
    super.key,
    required this.lang,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            lang == 'English'
                ? Scaffold.of(context).openEndDrawer()
                : Scaffold.of(context).openDrawer();
          },
          child: Stack(
            children: [
              SvgPicture.asset(
                lang == 'English' ? ImageAssets.circleLeft : ImageAssets.circleRight,
              ),
              Positioned(
                top: 0,
                bottom: 0,
                left: lang == 'English' ? null : 2.w,
                right: lang == 'English' ? 2.w : null,
                child: CircleButton(
                  buttonWidget: SvgPicture.asset(ImageAssets.menu),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
