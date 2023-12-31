import 'package:china_omda/presentation/global_widget/omda_otp_text_field.dart';
import 'package:china_omda/presentation/presentation_managers/exports.dart';

class ConfirmCodeView extends StatelessWidget {
  final GlobalKey<FormState> confirmKey = GlobalKey<FormState>();

  ConfirmCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        AuthCubit cubit = AuthCubit.get(context);
        if (state is AuthRegisterSuccessState) {
          Navigator.pushReplacementNamed(context, Routes.loginRoute);
          cubit.clearRegisterText();
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
              child: Column(
                children: [
                  const AuthHeader(),
                  Text(
                    AppStrings.subscriptionConfirmation.tr(context),
                    style: TextStyle(
                      fontSize: AppStrings.lang.tr(context) == "Arabic" ? 16.sp : 20.sp,
                      color: ColorManager.primaryGreen,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    AppStrings.typeTheSubscription.tr(context),
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: ColorManager.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    AppStrings.confirmationCode.tr(context),
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: ColorManager.primaryGreen,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Form(
                    key: confirmKey,
                    child: OmdaOtp(
                      onSubmit: (value) {
                        cubit.confirmCodeController.text = value;
                        String password = cubit.regPassController.text;
                        String code = cubit.confirmCodeController.text;
                        if (confirmKey.currentState!.validate()) {
                          if (cubit.checkCode(code)) {
                            cubit.createUser(
                              phone: cubit.regPhoneController.text,
                              password: password,
                              country: cubit.regCountryController.text,
                              email: cubit.regEmailController.text,
                              name: cubit.regNameController.text,
                              accountType: cubit.accountType!,
                              countryCode: cubit.regCountryCodeController.text,
                            );
                          }
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    AppStrings.typeTheSubscription.tr(context),
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: ColorManager.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  // SizedBox(height: 2.h),
                  // Text(
                  //   AppStrings.confirmationEmail.tr(context),
                  //   style: TextStyle(
                  //     fontSize: 10.sp,
                  //     color: ColorManager.primaryGreen,
                  //     fontWeight: FontWeight.w700,
                  //   ),
                  // ),
                  // SizedBox(height: 2.h),
                  // const GlobalTextFormField(
                  //   textInputType: TextInputType.emailAddress,
                  //   // textController: cubit.emailController,
                  // ),
                  SizedBox(height: 6.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LangButton(
                        lang: AppStrings.next.tr(context),
                        onTap: () {
                          String password = cubit.regPassController.text;
                          String code = cubit.confirmCodeController.text;
                          if (confirmKey.currentState!.validate()) {
                            if (cubit.checkCode(code)) {
                              cubit.createUser(
                                phone: cubit.regPhoneController.text,
                                password: password,
                                country: cubit.regCountryController.text,
                                email: cubit.regEmailController.text,
                                name: cubit.regNameController.text,
                                accountType: cubit.accountType!,
                                countryCode: cubit.regCountryCodeController.text,
                              );
                            }
                          }
                        },
                        color: ColorManager.authGreen,
                      ),
                      MenuButton(lang: lang)
                    ],
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
