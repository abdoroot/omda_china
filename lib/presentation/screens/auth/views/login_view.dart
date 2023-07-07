import 'package:china_omda/presentation/global_widget/omda_otp_text_field.dart';
import 'package:china_omda/presentation/presentation_managers/exports.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        AuthCubit cubit = AuthCubit.get(context);
        if (state is AuthLoginSuccessState) {
          uId = state.uId;
          CachHelper.saveData(key: 'uId', value: state.uId);
          CachHelper.saveData(key: 'accountType', value: state.accountType);
          String i = CachHelper.getData(key: 'accountType');
          print(i);
          cubit.clearLoginText();
          if (state.accountType != 'admin') {
            Navigator.pushReplacementNamed(context, Routes.bottomNav);
          } else {
            Navigator.pushReplacementNamed(context, Routes.adminPanel);
          }
        }
      },
      builder: (context, state) {
        AuthCubit cubit = AuthCubit.get(context);
        var lang = AppStrings.lang.tr(context);
        return Scaffold(
          backgroundColor: ColorManager.primary,
          drawerEnableOpenDragGesture: lang == 'English' ? false : true,
          endDrawerEnableOpenDragGesture: lang == 'English' ? true : false,
          body: SafeArea(
            child: Form(
              key: loginKey,
              child: Column(
                children: [
                  const AuthHeader(),
                  Text(
                    AppStrings.welcome.tr(context),
                    style: TextStyle(
                      height: 1.5,
                      fontSize: 23.sp,
                      color: ColorManager.primaryGreen,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    AppStrings.stepAway.tr(context),
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: ColorManager.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  GlobalIntlTextFormField(
                    controller: cubit.loginPhoneController,
                    filledColor: ColorManager.white,
                    horizontal: 9.w,
                  ),
                  Text(
                    AppStrings.pinCode.tr(context),
                    style: TextStyle(
                      height: 2.5,
                      fontSize: 13.sp,
                      color: ColorManager.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  OmdaOtp(
                    onSubmit: (value) {
                      cubit.loginPasswordOtp.text = value;
                      if (loginKey.currentState!.validate()) {
                        cubit.userLogin(phone: cubit.loginPhoneController.text, password: value);
                      }
                    },
                  ),
                  SizedBox(height: 2.h),
                  SizedBox(
                    width: 70.w,
                    child: Text(
                      AppStrings.bySigningIn.tr(context),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      textWidthBasis: TextWidthBasis.parent,
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: ColorManager.brownText,
                        fontWeight: FontWeight.w400,
                        height: 1.2,
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GlobalButton(
                        text: AppStrings.newRegistration.tr(context),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, Routes.registerRoute);
                        },
                        color: ColorManager.primaryGreen,
                        colorText: ColorManager.black,
                        height: 4.h,
                        width: 35.w,
                      ),
                      SizedBox(width: 2.w),
                      GlobalButton(
                        text: AppStrings.forgotYourPassword.tr(context),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, Routes.forgotPasswordRoute);
                        },
                        color: ColorManager.brown,
                        colorText: ColorManager.white,
                        height: 4.5.h,
                        width: 45.w,
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LangButton(
                        lang: lang,
                        onTap: () {
                          HomeCubit.get(context).changeLanguage();
                        },
                      ),
                      MenuButton(lang: lang)
                    ],
                  ),
                  const Spacer(flex: 1),
                  GestureDetector(
                    onTap: () {
                      if (loginKey.currentState!.validate()) {
                        cubit.userLogin(
                          phone: cubit.loginPhoneController.text,
                          password: cubit.loginPasswordOtp.text,
                        );
                      }
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SvgPicture.asset(ImageAssets.circleLogin),
                        Text(
                          AppStrings.login.tr(context),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: ColorManager.brownText,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
