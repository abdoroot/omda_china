import 'package:china_omda/presentation/global_widget/omda_intl_number.dart';
import 'package:china_omda/presentation/presentation_managers/exports.dart';

class ConnectWithUsView extends StatelessWidget {
  final bool isLogin;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ConnectWithUsView({
    super.key,
    required this.isLogin,
  });

  @override
  Widget build(BuildContext context) {
    String lang = AppStrings.lang.tr(context);
    return BlocConsumer<DrawerCubit, DrawerState>(
      listener: (context, state) {},
      builder: (context, state) {
        DrawerCubit cubit = DrawerCubit.get(context);
        return Scaffold(
          drawerEnableOpenDragGesture: lang == 'English' ? false : true,
          endDrawerEnableOpenDragGesture: lang == 'English' ? true : false,
          body: Column(
            children: [
              HeaderView(
                headerText: AppStrings.connectUs,
                isLogin: isLogin,
              ),
              Form(
                key: formKey,
                child: Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.connectWithUs.tr(context),
                          style: TextStyle(
                            color: ColorManager.text,
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.0.w),
                          child: Column(
                            children: [
                              OmdaTextFormFiled(
                                lableText: AppStrings.name,
                                enabled: true,
                                controller: cubit.connectNameController,
                              ),
                              SizedBox(height: 2.h),
                              OmdaTextFormFiled(
                                lableText: AppStrings.companyName,
                                enabled: true,
                                controller: cubit.connectCompanyNameController,
                              ),
                              SizedBox(height: 2.h),
                              OmdaTextFormFiled(
                                lableText: AppStrings.email,
                                enabled: true,
                                controller: cubit.connectEmailController,
                              ),
                              SizedBox(height: 2.h),
                              OmdaIntlNumber(
                                controller: cubit.connectPhoneController,
                                filled: false,
                                borderColor: ColorManager.borderGrey,
                                padding: 0,
                                height: 10.h,
                                borderRadius: 5,
                              ),
                              SizedBox(height: 2.h),
                              OmdaTextArea(
                                enabled: true,
                                lableText: AppStrings.message,
                                controller: cubit.connectMessageController,
                              ),
                              SizedBox(height: 2.h),
                              GlobalButton(
                                text: 'ارسال',
                                color: ColorManager.brown,
                                height: 6.h,
                                width: 50.w,
                                colorText: ColorManager.white,
                                onPressed: () {
                                  if (formKey.currentState!.validate() &&
                                      cubit.connectMessageController.text.isNotEmpty) {
                                    cubit
                                        .snedExternalMessage(
                                      senderName: cubit.connectNameController.text,
                                      senderCompanyName: cubit.connectCompanyNameController.text,
                                      senderPhone: cubit.connectPhoneController.text,
                                      message: cubit.connectMessageController.text,
                                      senderEmail: cubit.connectEmailController.text,
                                    )
                                        .then((value) {
                                      cubit.clearExternalMessage();
                                      Navigator.pop(context);
                                    });
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: isLogin ? const SizedBox() : const BottomWidget(),
          drawer: isLogin ? null : const DrawerView(isLogin: false),
          endDrawer: isLogin ? null : const DrawerView(isLogin: false),
        );
      },
    );
  }
}
