import 'package:china_omda/presentation/presentation_managers/exports.dart';
import 'package:china_omda/presentation/screens/admin_panel/views/users/user_profile.dart';
import 'package:china_omda/presentation/screens/admin_panel/widgets/user_item.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {},
      builder: (context, state) {
        AdminCubit cubit = AdminCubit.get(context);
        var lang = AppStrings.lang.tr(context);
        return Scaffold(
          drawerEnableOpenDragGesture: lang == 'English' ? false : true,
          endDrawerEnableOpenDragGesture: lang == 'English' ? true : false,
          backgroundColor: ColorManager.white,
          body: Column(
            children: [
              const HeaderView(
                headerText: AppStrings.users,
                isLogin: false,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0.w),
                    child: Column(
                      children: [
                        Text(
                          AppStrings.numberOfUser.tr(context),
                          style: TextStyle(
                            color: ColorManager.secondary,
                            height: 1,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            StreamBuilder<List<UserModel>>(
                              stream: cubit.getActiveUsers(),
                              builder: (context, snapshot) {
                                return Text(
                                  "${AppStrings.active.tr(context)} : ${snapshot.data == null ? 0 : snapshot.data!.length}",
                                  style: TextStyle(
                                    color: ColorManager.primaryGreen,
                                    height: 0.5,
                                  ),
                                );
                              },
                            ),
                            StreamBuilder<List<UserModel>>(
                              stream: cubit.getInActiveUsers(),
                              builder: (context, snapshot) {
                                return Text(
                                  "${AppStrings.inActive.tr(context)} : ${snapshot.data == null ? 0 : snapshot.data!.length}",
                                  style: TextStyle(
                                    color: ColorManager.red,
                                    height: 0.5,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 2.h),
                        DrawerDivider(
                          dividerText: AppStrings.users,
                          color: ColorManager.white,
                          colorText: ColorManager.primary,
                          fontSize: 12.sp,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppStrings.country.tr(context),
                              style: TextStyle(
                                fontSize: 11.sp,
                              ),
                            ),
                            Text(
                              AppStrings.dateOfRegistration.tr(context),
                              style: TextStyle(
                                fontSize: 11.sp,
                              ),
                            ),
                            Text(
                              AppStrings.name.tr(context),
                              style: TextStyle(
                                fontSize: 11.sp,
                              ),
                            ),
                            Text(
                              AppStrings.status.tr(context),
                              style: TextStyle(
                                fontSize: 11.sp,
                              ),
                            ),
                            Text(
                              AppStrings.view.tr(context),
                              style: TextStyle(
                                fontSize: 11.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.h),
                        StreamBuilder<List<UserModel>>(
                          stream: cubit.getAllUsers(),
                          builder: (context, snapshot) {
                            if (snapshot.data == null) {
                              return const SizedBox();
                            }
                            return ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) => UserItem(
                                userModel: snapshot.data![index],
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            UserProfile(userModel: snapshot.data![index])),
                                  );
                                },
                              ),
                              separatorBuilder: (context, index) => Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.0.w),
                                child: const Divider(thickness: 1),
                              ),
                              itemCount: snapshot.data!.length,
                            );
                          },
                        ),
                      ],
                    ),
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
