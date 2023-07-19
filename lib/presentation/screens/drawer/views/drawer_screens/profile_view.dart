import 'package:china_omda/presentation/global_widget/omda_intl_number.dart';
import 'package:china_omda/presentation/presentation_managers/exports.dart';

class ProfileView extends StatelessWidget {
  final bool isLogin;
  const ProfileView({
    super.key,
    required this.isLogin,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DrawerCubit, DrawerState>(
      listener: (context, state) {},
      builder: (context, state) {
        DrawerCubit cubit = DrawerCubit.get(context);
        String lang = AppStrings.lang.tr(context);
        return Scaffold(
          drawerEnableOpenDragGesture: lang == 'English' ? false : true,
          endDrawerEnableOpenDragGesture: lang == 'English' ? true : false,
          body: Column(
            children: [
              HeaderView(
                headerText: AppStrings.profile,
                isLogin: isLogin,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 2.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0.w),
                        child: Column(
                          children: [
                            StreamBuilder<UserModel>(
                              stream: cubit.getUserData(),
                              builder: (context, snapshot) {
                                cubit.idController.text =
                                    snapshot.data == null ? '' : snapshot.data!.id ?? '000';
                                return OmdaTextFormFiled(
                                  controller: cubit.idController,
                                  lableText: AppStrings.userId,
                                  enabled: false,
                                  width: 50.w,
                                  contentTextColor: ColorManager.red,
                                );
                              },
                            ),
                            SizedBox(height: 2.h),
                            StreamBuilder<UserModel>(
                              stream: cubit.getUserData(),
                              builder: (context, snapshot) {
                                cubit.nameController.text =
                                    snapshot.data == null ? '' : snapshot.data!.name ?? '';
                                return OmdaTextFormFiled(
                                  controller: cubit.nameController,
                                  lableText: AppStrings.name,
                                  enabled: false,
                                );
                              },
                            ),
                            SizedBox(height: 2.h),
                            StreamBuilder<UserModel>(
                              stream: cubit.getUserData(),
                              builder: (context, snapshot) {
                                return OmdaIntlNumber(
                                  enabled: false,
                                  intialCountryCode: snapshot.data!.countryCode!.toUpperCase(),
                                  controller: cubit.phoneController,
                                  filled: false,
                                  borderColor: ColorManager.borderGrey,
                                  padding: 0,
                                  height: 10.h,
                                  borderRadius: 5,
                                  phoneNumber: snapshot.data!.phone!.replaceRange(0, 4, ''),
                                );
                              },
                            ),
                            SizedBox(height: 2.5.h),
                            StreamBuilder<UserModel>(
                              stream: cubit.getUserData(),
                              builder: (context, snapshot) {
                                cubit.emailController.text =
                                    snapshot.data == null ? '' : snapshot.data!.email ?? '';
                                return OmdaTextFormFiled(
                                  lableText: AppStrings.email,
                                  enabled: false,
                                  controller: cubit.emailController,
                                );
                              },
                            ),
                            SizedBox(height: 2.h),
                            StreamBuilder<UserModel>(
                              stream: cubit.getUserData(),
                              builder: (context, snapshot) {
                                cubit.countryController.text =
                                    snapshot.data == null ? '' : snapshot.data!.country ?? '';
                                return OmdaTextFormFiled(
                                  lableText: AppStrings.country,
                                  enabled: false,
                                  controller: cubit.countryController,
                                );
                              },
                            ),
                            SizedBox(height: 2.h),
                            StreamBuilder<UserModel>(
                              stream: cubit.getUserData(),
                              builder: (context, snapshot) {
                                cubit.accountTypeController.text = snapshot.data == null
                                    ? ''
                                    : snapshot.data!.accountType!.tr(context);
                                return OmdaTextFormFiled(
                                  lableText: AppStrings.accountType,
                                  enabled: false,
                                  controller: cubit.accountTypeController,
                                );
                              },
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
          bottomNavigationBar: const BottomWidget(),
          drawer: const DrawerView(isLogin: false),
          endDrawer: const DrawerView(isLogin: false),
        );
      },
    );
  }
}
