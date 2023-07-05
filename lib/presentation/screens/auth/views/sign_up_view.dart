import 'package:china_omda/presentation/global_widget/omda_otp_text_field.dart';
import 'package:china_omda/presentation/presentation_managers/exports.dart';

class SignUpView extends StatelessWidget {
  final GlobalKey<FormState> regKey = GlobalKey<FormState>();
  SignUpView({Key? key}) : super(key: key);

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
              child: Form(
                key: regKey,
                child: Column(
                  children: [
                    const AuthHeader(),
                    Text(
                      AppStrings.join.tr(context),
                      style: TextStyle(
                        height: 1.5,
                        fontSize: 23.sp,
                        color: ColorManager.primaryGreen,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      AppStrings.simple.tr(context),
                      style: TextStyle(
                        fontSize: AppStrings.lang.tr(context) == 'English' ? 13.sp : 10.sp,
                        color: ColorManager.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Column(
                      children: [
                        GlobalTextFormField(
                          textInputType: TextInputType.name,
                          textController: cubit.regNameController,
                          hintText: AppStrings.fullName.tr(context),
                        ),
                        SizedBox(height: 2.h),
                        GlobalIntlTextFormField(
                          horizontal: 9.w,
                          filledColor: ColorManager.white,
                          controller: cubit.regPhoneController,
                        ),
                        SizedBox(height: 2.h),
                        GlobalTextFormField(
                          textInputType: TextInputType.emailAddress,
                          textController: cubit.regEmailController,
                          hintText: AppStrings.email.tr(context),
                        ),
                        SizedBox(height: 2.h),
                        GlobalDropDownButton(
                          height: 7.h,
                          hintText: AppStrings.accountType,
                          value: cubit.accountType,
                          border: InputBorder.none,
                          onChanged: (String? val) {
                            cubit.selecteAccountType(val!);
                          },
                          items: cubit.option,
                          valueSize: 14.sp,
                        ),
                        SizedBox(height: 2.h),
                        GestureDetector(
                          onTap: () {
                            showCountryPicker(
                              context: context,
                              countryListTheme: CountryListThemeData(
                                flagSize: 25,
                                backgroundColor: Colors.white,
                                textStyle: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.blueGrey,
                                ),
                                bottomSheetHeight: 50.h,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
                                inputDecoration: InputDecoration(
                                  labelText: AppStrings.search.tr(context),
                                  hintText: AppStrings.startTypingSearch.tr(context),
                                  contentPadding: const EdgeInsets.all(15),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: const Color(0xFF8C98A8).withOpacity(0.2),
                                    ),
                                  ),
                                ),
                              ),
                              onSelect: (Country country) {
                                cubit.regCountryController.text = country.name;
                              },
                            );
                          },
                          child: GlobalTextFormField(
                            enable: false,
                            textInputType: TextInputType.text,
                            textController: cubit.regCountryController,
                            hintText: AppStrings.country.tr(context),
                            style: TextStyle(
                              color: ColorManager.black,
                            ),
                            suffixIcon: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  ImageAssets.arrowBottom,
                                  height: 1.3.h,
                                ),
                                SvgPicture.asset(
                                  ImageAssets.arrowBottom,
                                  height: 1.3.h,
                                ),
                              ],
                            ),
                            contentPadding: EdgeInsets.only(left: 33.w, right: 32.w),
                            hintStyle: TextStyle(
                              fontSize: 12.sp,
                              color: ColorManager.grey1,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      AppStrings.accessCode.tr(context),
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: ColorManager.brownText,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    OmdaOtp(
                      onSubmit: (value) {
                        cubit.regPassController.text = value;
                      },
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      AppStrings.confirmAccessCode.tr(context),
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: ColorManager.brownText,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    OmdaOtp(
                      onSubmit: (value) {
                        cubit.regConfirmPassController.text = value;
                        if (regKey.currentState!.validate()) {
                          if (cubit.checkPassword()) {
                            cubit.twilioServices.sendSMS(cubit.regPhoneController.text).then(
                              (value) {
                                Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                                  MaterialPageRoute(builder: (context) => ConfirmCodeView()),
                                  (route) => false,
                                );
                              },
                            );
                          }
                        }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LangButton(
                          lang: AppStrings.next.tr(context),
                          onTap: () {
                            if (regKey.currentState!.validate()) {
                              if (cubit.checkPassword()) {
                                cubit.twilioServices.sendSMS(cubit.regPhoneController.text).then(
                                  (value) {
                                    Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                                      MaterialPageRoute(builder: (context) => ConfirmCodeView()),
                                      (route) => false,
                                    );
                                  },
                                );
                              }
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
                    SizedBox(height: 5.h),
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
