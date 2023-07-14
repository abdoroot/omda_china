import 'package:china_omda/presentation/presentation_managers/exports.dart';

class UserProfile extends StatelessWidget {
  final UserModel userModel;

  const UserProfile({
    super.key,
    required this.userModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {},
      builder: (context, state) {
        AdminCubit cubit = AdminCubit.get(context);
        var lang = AppStrings.lang.tr(context);
        cubit.idController.text = userModel.id ?? '';
        cubit.nameController.text = userModel.name ?? '';
        cubit.phoneController.text = userModel.phone!.substring(4);
        cubit.emailController.text = userModel.email ?? '';
        cubit.countryController.text = userModel.country ?? '';
        cubit.accountTypeController.text = userModel.accountType!.tr(context);
        return Scaffold(
          drawerEnableOpenDragGesture: lang == 'English' ? false : true,
          endDrawerEnableOpenDragGesture: lang == 'English' ? true : false,
          backgroundColor: ColorManager.white,
          body: Column(
            children: [
              const HeaderView(
                headerText: AppStrings.userProfile,
                isLogin: false,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 2.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0.w),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${AppStrings.dateOfRegistration.tr(context)}\n${Jiffy.parse(userModel.registerDate!).format(pattern: 'dd/MM/yyyy')}',
                                  style: const TextStyle(),
                                ),
                                OmdaTextFormFiled(
                                  controller: cubit.idController,
                                  lableText: AppStrings.userId,
                                  enabled: false,
                                  width: 40.w,
                                  contentTextColor: ColorManager.red,
                                ),
                                Container(
                                  width: 20.w,
                                  height: 5.h,
                                  decoration: BoxDecoration(
                                    color: userModel.accountStatus!
                                        ? ColorManager.primaryGreen
                                        : ColorManager.red,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      userModel.accountStatus!
                                          ? AppStrings.active.tr(context)
                                          : AppStrings.inActive.tr(context),
                                      style: TextStyle(
                                        color: ColorManager.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 2.h),
                            OmdaTextFormFiled(
                              controller: cubit.nameController,
                              lableText: AppStrings.name,
                              enabled: true,
                            ),
                            SizedBox(height: 2.h),
                            GlobalIntlTextFormField(
                              controller: cubit.phoneController,
                              height: 8.h,
                              enabled: true,
                            ),
                            SizedBox(height: 2.5.h),
                            OmdaTextFormFiled(
                              lableText: AppStrings.email,
                              enabled: true,
                              controller: cubit.emailController,
                            ),
                            SizedBox(height: 2.h),
                            OmdaTextFormFiled(
                              lableText: AppStrings.country,
                              enabled: true,
                              controller: cubit.countryController,
                            ),
                            SizedBox(height: 2.h),
                            OmdaTextFormFiled(
                              lableText: AppStrings.accountType,
                              enabled: true,
                              controller: cubit.accountTypeController,
                            ),
                            SizedBox(height: 2.h),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
