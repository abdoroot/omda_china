import 'package:china_omda/presentation/presentation_managers/exports.dart';
import 'package:china_omda/presentation/screens/change_control_password/cubit/change_control_password_state.dart';

class ChangeControlPasswordView extends StatelessWidget {
  final bool isLogin;
  const ChangeControlPasswordView({
    Key? key,
    required this.isLogin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangeControlPasswordCubit, ChangeControlPasswordStates>(
      listener: (context, state) {},
      builder: (context, state) {
        ChangeControlPasswordCubit cubit = ChangeControlPasswordCubit.get(context);
        String lang = AppStrings.lang.tr(context);
        return Scaffold(
          drawerEnableOpenDragGesture: lang == 'English' ? false : true,
          endDrawerEnableOpenDragGesture: lang == 'English' ? true : false,
          body: Column(
            children: [
              HeaderView(
                headerText: AppStrings.changeAccessCode,
                isLogin: isLogin,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.enterAccessCode.tr(context),
                          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 2.h),
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: AccessCodeWidget(
                            controllers: [
                              cubit.passwordOneController,
                              cubit.passwordTwoController,
                              cubit.passwordThreeController,
                              cubit.passwordFourController,
                            ],
                            enabledColor: ColorManager.borderGrey,
                            focusedColor: ColorManager.borderGrey,
                            filled: false,
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          AppStrings.newAccessCode.tr(context),
                          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: AccessCodeWidget(
                            controllers: [
                              cubit.passwordOneController,
                              cubit.passwordTwoController,
                              cubit.passwordThreeController,
                              cubit.passwordFourController,
                            ],
                            enabledColor: ColorManager.borderGrey,
                            focusedColor: ColorManager.borderGrey,
                            filled: false,
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          AppStrings.confirmAccessCode.tr(context),
                          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: AccessCodeWidget(
                            controllers: [
                              cubit.passwordOneController,
                              cubit.passwordTwoController,
                              cubit.passwordThreeController,
                              cubit.passwordFourController,
                            ],
                            enabledColor: ColorManager.borderGrey,
                            focusedColor: ColorManager.borderGrey,
                            filled: false,
                          ),
                        ),
                        SizedBox(height: 3.h),
                        Row(
                          children: [
                            Stack(
                              children: [
                                SvgPicture.asset(
                                  AppStrings.lang.tr(context) == 'English'
                                      ? ImageAssets.circlePrimeRight
                                      : ImageAssets.circlePrimeLeft,
                                ),
                                Positioned(
                                  top: 0,
                                  bottom: 0,
                                  left: AppStrings.lang.tr(context) == 'English' ? 2.w : null,
                                  right: AppStrings.lang.tr(context) == 'English' ? null : 2.w,
                                  child: CircleButton(
                                    buttonColor: ColorManager.blueAccount,
                                    onTap: () {},
                                    buttonWidget: Text(
                                      AppStrings.changing.tr(context),
                                      style: TextStyle(
                                          color: ColorManager.black, fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: const BottomWidget(),
          drawer: const DrawerView(isLogin: false),
          endDrawer: const DrawerView(isLogin: false),
        );
      },
    );
  }
}
