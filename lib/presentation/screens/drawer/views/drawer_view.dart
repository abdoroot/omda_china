import 'package:china_omda/presentation/presentation_managers/exports.dart';

class DrawerView extends StatelessWidget {
  final bool isLogin;
  final bool? isAdmin;

  const DrawerView({
    super.key,
    required this.isLogin,
    this.isAdmin = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DrawerCubit, DrawerState>(
      listener: (context, state) {},
      builder: (context, state) {
        DrawerCubit cubit = DrawerCubit.get(context);
        return Drawer(
          width: 60.w,
          backgroundColor: ColorManager.secondary,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 5.h),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if (isLogin == false)
                    StreamBuilder<UserModel>(
                      stream: cubit.getUserData(),
                      builder: (context, snapshot) {
                        return snapshot.data == null
                            ? const SizedBox()
                            : Column(
                                children: [
                                  Container(
                                    height: 5.h,
                                    width: 15.w,
                                    color: Colors.yellow,
                                  ),
                                  Text(
                                    snapshot.data == null ? '' : snapshot.data!.name ?? 'User Name',
                                    style: TextStyle(
                                      color: ColorManager.white,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                  Text(
                                    snapshot.data == null
                                        ? ''
                                        : snapshot.data!.accountType!.tr(context),
                                    style: TextStyle(
                                      color: ColorManager.white,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                  Text(
                                    snapshot.data == null ? '' : snapshot.data!.id ?? 'User id',
                                    style: TextStyle(
                                      color: ColorManager.white,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                ],
                              );
                      },
                    ),
                  if (isLogin == true)
                    SvgPicture.asset(
                      ImageAssets.splashlogo,
                      height: 18.h,
                      width: 18.w,
                    ),
                  SizedBox(height: isLogin == true ? 2.h : 0.5.h),
                  const DrawerDivider(dividerText: AppStrings.mainMenu),
                  DrawerItem(
                    onTap: () {
                      if (isLogin == true) {
                        Navigator.pop(context);
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginView(),
                          ),
                          (route) => true,
                        );
                      } else {
                        BottomNavBarCubit.get(context).changeScreenIndex(0);
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BottomNavBarView(),
                          ),
                          (route) => false,
                        );
                      }
                    },
                    itemText: AppStrings.main,
                  ),
                  SizedBox(height: 1.h),
                  DrawerItem(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => KnowUsView(isLogin: isLogin)),
                      );
                    },
                    itemText: AppStrings.knowUs,
                  ),
                  SizedBox(height: 1.h),
                  DrawerItem(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TermAndConditionsView(isLogin: isLogin)),
                      );
                    },
                    itemText: AppStrings.termsConditions,
                  ),
                  SizedBox(height: 1.h),
                  DrawerItem(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HowWork(isLogin: isLogin)),
                      );
                    },
                    itemText: AppStrings.howWork,
                  ),
                  SizedBox(height: 1.h),
                  DrawerItem(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ConnectWithUsView(isLogin: isLogin)),
                      );
                    },
                    itemText: AppStrings.connectUs,
                  ),
                  SizedBox(height: 1.h),
                  DrawerItem(
                    onTap: () {},
                    itemText: AppStrings.chinesePortals,
                    image: SvgPicture.asset(
                      'assets/images/china_gate.svg',
                      height: 8.h,
                      width: 8.w,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  if (isAdmin == true)
                    DrawerItem(
                      onTap: () {
                        retrieveCountryForIP();
                        Navigator.pushReplacementNamed(context, Routes.loginRoute);
                        CachHelper.removeData(key: 'uId');
                        CachHelper.removeData(key: 'accountType');
                        BottomNavBarCubit.get(context).screenIndex = 0;
                      },
                      itemText: AppStrings.logout,
                    ),
                  if (isLogin == false)
                    isAdmin!
                        ? const SizedBox()
                        : Column(
                            children: [
                              const DrawerDivider(dividerText: AppStrings.myAccount),
                              DrawerItem(
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProfileView(isLogin: isLogin)),
                                  );
                                },
                                itemText: AppStrings.profile,
                              ),
                              SizedBox(height: 1.h),
                              DrawerItem(
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyDashboardView(isLogin: isLogin)),
                                  );
                                },
                                itemText: AppStrings.myBoard,
                              ),
                              SizedBox(height: 1.h),
                              DrawerItem(
                                onTap: () {
                                  Navigator.pop(context);
                                  showDialog(
                                    context: context,
                                    builder: (context) => const CancelAccountDialog(),
                                  );
                                },
                                itemText: AppStrings.cancelAccount,
                              ),
                              SizedBox(height: 1.h),
                              DrawerItem(
                                onTap: () {
                                  retrieveCountryForIP();
                                  Navigator.pushReplacementNamed(context, Routes.loginRoute);
                                  CachHelper.removeData(key: 'uId');
                                  CachHelper.removeData(key: 'accountType');
                                  BottomNavBarCubit.get(context).screenIndex = 0;
                                },
                                itemText: AppStrings.logout,
                              ),
                            ],
                          ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
