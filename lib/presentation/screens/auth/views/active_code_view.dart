import 'package:china_omda/presentation/presentation_managers/exports.dart';

class ActiveCodeView extends StatefulWidget {
  const ActiveCodeView({Key? key}) : super(key: key);

  @override
  State<ActiveCodeView> createState() => _ActiveCodeViewState();
}

class _ActiveCodeViewState extends State<ActiveCodeView> {
  bool isClickable = false;
  int remainingTime = 60;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(
          () {
            if (remainingTime > 0) {
              remainingTime--;
            } else {
              isClickable = true;
              timer.cancel();
            }
          },
        );
      },
    );
  }

  void handleClick() {
    String phone = AuthCubit.get(context).forgetPasswordController.text;
    if (isClickable) {
      AuthCubit.get(context).twilioServices.sendSMS(phone);
      setState(() {
        remainingTime = 60;
        isClickable = false;
        startTimer();
      });
    }
  }

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
                key: cubit.activeCodeKey,
                child: Column(
                  children: [
                    const AuthHeader(),
                    Text(
                      AppStrings.changeCode.tr(context),
                      style: TextStyle(
                        fontSize: 23.sp,
                        color: ColorManager.primaryGreen,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      AppStrings.confirmationPassword.tr(context),
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: ColorManager.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      AppStrings.changeCode.tr(context),
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: ColorManager.primaryGreen,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: AccessCodeWidget(
                        controllers: [
                          cubit.activeFirstPassController,
                          cubit.activeSecondPassController,
                          cubit.activeThirdPassController,
                          cubit.activeFourthPassController,
                        ],
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      isClickable
                          ? lang != "English"
                              ? 'Resend Code'
                              : 'أعد الإرسال'
                          : lang != "English"
                              ? 'seconds $remainingTime'
                              : '$remainingTime ثانية',
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: ColorManager.primaryGreen,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 3.w),
                      child: GlobalButton(
                        text: AppStrings.resend.tr(context),
                        onPressed: isClickable ? handleClick : null,
                        color: isClickable ? ColorManager.black : ColorManager.greyBold,
                        colorText: ColorManager.white,
                        height: 4.h,
                        width: 37.w,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LangButton(
                          lang: AppStrings.next.tr(context),
                          onTap: () {
                            String code = cubit.activeFirstPassController.text +
                                cubit.activeSecondPassController.text +
                                cubit.activeThirdPassController.text +
                                cubit.activeFourthPassController.text;
                            if (cubit.activeCodeKey.currentState!.validate()) {
                              if (cubit.checkCode(code)) {
                                Navigator.pushReplacementNamed(context, Routes.changePassword);
                              }
                            }
                          },
                        ),
                        MenuButton(
                          lang: lang,
                        )
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

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
