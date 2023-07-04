import 'package:china_omda/presentation/presentation_managers/exports.dart';

class ChangeCodeView extends StatelessWidget {
  const ChangeCodeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        AuthCubit cubit = AuthCubit.get(context);
        if (state is AuthChangePasswordSuccessState) {
          cubit.clearChangePasswordText();
          cubit.changePasswordMessage(context: context);
        }
      },
      builder: (context, state) {
        AuthCubit cubit = AuthCubit.get(context);
        var lang = AppStrings.lang.tr(context);
        return Scaffold(
          drawerEnableOpenDragGesture: lang == 'English' ? false : true,
          endDrawerEnableOpenDragGesture: lang == 'English' ? true : false,
          backgroundColor: ColorManager.primary,
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: cubit.changePasswordKey,
                child: Column(
                  children: [
                    const AuthHeader(),
                    Text(
                      AppStrings.changeAccessCode.tr(context),
                      style: TextStyle(
                        fontSize: AppStrings.lang.tr(context) == "Arabic" ? 18.sp : 23.sp,
                        color: ColorManager.primaryGreen,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      AppStrings.typeConfirm.tr(context),
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: ColorManager.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      AppStrings.newAccessCode.tr(context),
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: ColorManager.primaryGreen,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: AccessCodeWidget(
                        controllers: [
                          cubit.changeFirstPassController,
                          cubit.changeSecondPassController,
                          cubit.changeThirdPassController,
                          cubit.changeFourthPassController,
                        ],
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      AppStrings.confirmCode.tr(context),
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: ColorManager.primaryGreen,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: AccessCodeWidget(
                        controllers: [
                          cubit.confirmChangeFirstPassController,
                          cubit.confirmChangeSecondPassController,
                          cubit.confirmChangeThirdPassController,
                          cubit.confirmChangeFourthPassController,
                        ],
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LangButton(
                          lang: AppStrings.next.tr(context),
                          onTap: () {
                            String newPassword = cubit.changeFirstPassController.text +
                                cubit.changeSecondPassController.text +
                                cubit.changeThirdPassController.text +
                                cubit.changeFourthPassController.text;
                            if (cubit.changePasswordKey.currentState!.validate()) {
                              if (cubit.checkNewPassword()) {
                                cubit.changePassword(
                                  phone: cubit.forgetPasswordController.text,
                                  newPassword: newPassword,
                                );
                              }
                            }
                          },
                        ),
                        MenuButton(lang: lang)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          endDrawer: const DrawerView(isLogin: true),
          drawer: const DrawerView(isLogin: true),
        );
      },
    );
  }
}
