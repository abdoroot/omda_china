import 'package:china_omda/presentation/presentation_managers/exports.dart';

class BottomWidget extends StatelessWidget {
  final Widget? circleButton;
  final Color? buttonColor;
  final Color? buttonTextColor;

  const BottomWidget({
    super.key,
    this.circleButton,
    this.buttonColor,
    this.buttonTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomNavBarCubit, BottomNavBarState>(
      listener: (context, state) {},
      builder: (context, state) {
        BottomNavBarCubit cubit = BottomNavBarCubit.get(context);
        return SizedBox(
          width: double.infinity,
          height: 10.h,
          child: Stack(
            children: [
              Positioned(
                right: 0,
                left: 0,
                bottom: 0,
                child: Container(
                  height: 8.5.h,
                  width: double.infinity,
                  color: ColorManager.primary,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: SizedBox(
                  height: 10.h,
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(width: 0.5.h),
                      Expanded(
                        child: BottomNavBarItem(
                          onTap: () => cubit.changeScreenIndex(0),
                          index: 0,
                          image: ImageAssets.home,
                          title: AppStrings.home,
                          width: 13.w,
                        ),
                      ),
                      SizedBox(width: 2.h),
                      Expanded(
                        child: BottomNavBarItem(
                          onTap: () => cubit.changeScreenIndex(1),
                          index: 1,
                          image: ImageAssets.schedule,
                          title: AppStrings.schedual,
                          width: 15,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.bottomCenter,
                        child: Stack(
                          children: [
                            SvgPicture.asset(
                              'assets/images/bottom.svg',
                              height: 12.h,
                            ),
                            Positioned(
                              left: 0,
                              right: 0,
                              top: 1.h,
                              child: circleButton ??
                                  CircleButton(
                                    onTap: () {
                                      Navigator.pushNamed(context, Routes.newOrders);
                                      AddOrdersCubit.get(context).generateOrderId();
                                    },
                                    buttonWidget: Text(
                                      AppStrings.newOrder.tr(context),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: buttonTextColor ?? ColorManager.secondary,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        height: 1,
                                      ),
                                    ),
                                    buttonColor: buttonColor ?? ColorManager.white,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: BottomNavBarItem(
                          onTap: () => cubit.changeScreenIndex(2),
                          index: 2,
                          image: ImageAssets.calendar,
                          title: AppStrings.calendar,
                          width: 16,
                        ),
                      ),
                      SizedBox(width: 2.h),
                      Expanded(
                        child: BottomNavBarItem(
                          onTap: () {
                            HomeCubit.get(context).changeLanguage();
                          },
                          image: ImageAssets.eyeOpen,
                          title: AppStrings.lang,
                          width: 12,
                        ),
                      ),
                      SizedBox(width: 0.5.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
