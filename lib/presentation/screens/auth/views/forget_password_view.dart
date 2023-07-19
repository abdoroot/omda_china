import 'package:china_omda/presentation/global_widget/omda_intl_number.dart';
import 'package:china_omda/presentation/presentation_managers/exports.dart';

class ForgetView extends StatelessWidget {
  const ForgetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
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
                key: cubit.forgetKey,
                child: Column(
                  children: [
                    const AuthHeader(),
                    Text(
                      AppStrings.forgotCode.tr(context),
                      style: TextStyle(
                        fontSize: 23.sp,
                        color: ColorManager.primaryGreen,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      AppStrings.helpYou.tr(context),
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: ColorManager.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 3.h),
                    OmdaIntlNumber(controller: cubit.forgetPasswordController),
                    SizedBox(height: 27.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LangButton(
                          lang: AppStrings.next.tr(context),
                          onTap: () {
                            if (cubit.forgetKey.currentState!.validate()) {
                              cubit.twilioServices
                                  .sendSMS(cubit.forgetPasswordController.text)
                                  .then((value) {
                                Navigator.pushReplacementNamed(context, Routes.activeCode);
                              });
                            }
                          },
                        ),
                        MenuButton(lang: lang)
                      ],
                    ),
                    GlobalButton(
                      text: AppStrings.haveAccount.tr(context),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, Routes.loginRoute);
                      },
                      color: ColorManager.black,
                      colorText: ColorManager.white,
                      height: 4.5.h,
                      width: 45.w,
                    ),
                  ],
                ),
              ),
            ),
          ),
          drawer: const DrawerView(isLogin: true),
          endDrawer: const DrawerView(isLogin: true),
        );
      },
    );
  }
}
