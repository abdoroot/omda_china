import 'package:china_omda/presentation/presentation_managers/exports.dart';

class HeaderView extends StatelessWidget {
  final String headerText;
  final Color? headerTextColor;
  final Widget? anotherWidget;
  final bool isLogin;
  final Function()? arrowTap;

  const HeaderView({
    super.key,
    required this.headerText,
    required this.isLogin,
    this.headerTextColor,
    this.anotherWidget,
    this.arrowTap,
  });

  @override
  Widget build(BuildContext context) {
    String lang = AppStrings.lang.tr(context);
    return SizedBox(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            ImageAssets.header,
            fit: BoxFit.fill,
            height: 36.h,
          ),
          if (isLogin == false)
            Positioned(
              top: 6.h,
              left: 3.w,
              child: GestureDetector(
                onTap: () {
                  lang == 'English'
                      ? Scaffold.of(context).openEndDrawer()
                      : Scaffold.of(context).openDrawer();
                },
                child: SvgPicture.asset(
                  ImageAssets.menu,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          Positioned(
            top: 6.h,
            right: 3.w,
            child: anotherWidget ??
                GestureDetector(
                  onTap: arrowTap ?? () => Navigator.of(context).pop(),
                  child: SvgPicture.asset(ImageAssets.arrow),
                ),
          ),
          Positioned(
            top: 3.h,
            child: Padding(
              padding: EdgeInsets.only(top: 2.5.h),
              child: SvgPicture.asset(
                ImageAssets.splashlogo,
                fit: BoxFit.cover,
                height: 17.h,
                width: 17.w,
              ),
            ),
          ),
          Positioned(
            bottom: 8.h,
            child: Text(
              headerText.tr(context),
              style: TextStyle(
                color: headerTextColor ?? ColorManager.primaryGreen,
                fontSize: 20.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
