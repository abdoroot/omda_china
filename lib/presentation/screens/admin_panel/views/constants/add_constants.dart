import 'package:china_omda/models/constant_model.dart';
import 'package:china_omda/presentation/presentation_managers/exports.dart';

class AddConstants extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AddConstants({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {},
      builder: (context, state) {
        var lang = AppStrings.lang.tr(context);
        AdminCubit cubit = AdminCubit.get(context);
        return Scaffold(
          drawerEnableOpenDragGesture: lang == 'English' ? false : true,
          endDrawerEnableOpenDragGesture: lang == 'English' ? true : false,
          backgroundColor: ColorManager.white,
          body: Column(
            children: [
              const HeaderView(
                headerText: AppStrings.constants,
                isLogin: false,
              ),
              StreamBuilder<ConstantModel>(
                  stream: cubit.getConstants(),
                  builder: (context, snapshot) {
                    cubit.chinaGateController.text = snapshot.data == null
                        ? ''
                        : snapshot.data!.chinaGateUrl!.replaceAll('https://', '');
                    cubit.knowUsArController.text =
                        snapshot.data == null ? '' : snapshot.data!.knowUsAr ?? '';
                    cubit.knowUsEnController.text =
                        snapshot.data == null ? '' : snapshot.data!.knowUsEn ?? '';
                    cubit.tirmsArController.text =
                        snapshot.data == null ? '' : snapshot.data!.termsAndConditionsAr ?? '';
                    cubit.tirmsEnController.text =
                        snapshot.data == null ? '' : snapshot.data!.termsAndConditionsEn ?? '';
                    cubit.howWorkArController.text =
                        snapshot.data == null ? '' : snapshot.data!.knowHowWorkAr ?? '';
                    cubit.howWorkEnController.text =
                        snapshot.data == null ? '' : snapshot.data!.knowHowWorkEn ?? '';
                    return Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                SizedBox(height: 2.h),
                                Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: Row(
                                    children: [
                                      Text(
                                        'https://',
                                        style: TextStyle(
                                          color: ColorManager.black,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      SizedBox(width: 2.w),
                                      Expanded(
                                        child: OmdaTextFormFiled(
                                          enabled: true,
                                          lableText: AppStrings.chinaGate,
                                          controller: cubit.chinaGateController,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 3.h),
                                OmdaTextArea(
                                  enabled: true,
                                  lableText: AppStrings.knowUsAr,
                                  controller: cubit.knowUsArController,
                                ),
                                SizedBox(height: 3.h),
                                OmdaTextArea(
                                  enabled: true,
                                  lableText: AppStrings.knowUsEn,
                                  controller: cubit.knowUsEnController,
                                ),
                                SizedBox(height: 3.h),
                                OmdaTextArea(
                                  enabled: true,
                                  lableText: AppStrings.termsConditionsAr,
                                  controller: cubit.tirmsArController,
                                ),
                                SizedBox(height: 3.h),
                                OmdaTextArea(
                                  enabled: true,
                                  lableText: AppStrings.termsConditionsEn,
                                  controller: cubit.tirmsEnController,
                                ),
                                SizedBox(height: 3.h),
                                OmdaTextArea(
                                  enabled: true,
                                  lableText: AppStrings.howWorkAr,
                                  controller: cubit.howWorkArController,
                                ),
                                SizedBox(height: 3.h),
                                OmdaTextArea(
                                  enabled: true,
                                  lableText: AppStrings.howWorkEn,
                                  controller: cubit.howWorkEnController,
                                ),
                                SizedBox(height: 3.h),
                                GlobalButton(
                                  text: 'save',
                                  color: ColorManager.secondary,
                                  height: 5.h,
                                  width: 25.w,
                                  colorText: ColorManager.white,
                                  raduis: 10,
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      if (snapshot.data == null) {
                                        cubit
                                            .addConstants(
                                          chinaGateUrl: cubit.chinaGateController.text,
                                          knowUsAr: cubit.knowUsArController.text,
                                          knowUsEn: cubit.knowUsEnController.text,
                                          knowHowWorkAr: cubit.howWorkArController.text,
                                          knowHowWorkEn: cubit.knowUsEnController.text,
                                          termsAndConditionsAr: cubit.tirmsArController.text,
                                          termsAndConditionsEn: cubit.tirmsEnController.text,
                                        )
                                            .then((value) {
                                          cubit.clearConstantsController();
                                          Navigator.pop(context);
                                        });
                                      } else {
                                        cubit
                                            .updateConstants(
                                          chinaGateUrl: cubit.chinaGateController.text,
                                          knowUsAr: cubit.knowUsArController.text,
                                          knowUsEn: cubit.knowUsEnController.text,
                                          knowHowWorkAr: cubit.howWorkArController.text,
                                          knowHowWorkEn: cubit.knowUsEnController.text,
                                          termsAndConditionsAr: cubit.tirmsArController.text,
                                          termsAndConditionsEn: cubit.tirmsEnController.text,
                                        )
                                            .then((value) {
                                          cubit.clearConstantsController();
                                          Navigator.pop(context);
                                        });
                                      }
                                    }
                                  },
                                ),
                                SizedBox(height: 3.h),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ],
          ),
          bottomNavigationBar: const BottomWidget(isAdmin: true),
          drawer: const DrawerView(isLogin: false, isAdmin: true),
          endDrawer: const DrawerView(isLogin: false, isAdmin: true),
        );
      },
    );
  }
}
