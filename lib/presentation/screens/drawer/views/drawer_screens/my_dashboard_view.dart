import 'package:china_omda/presentation/presentation_managers/exports.dart';

class MyDashboardView extends StatelessWidget {
  final bool isLogin;

  const MyDashboardView({
    Key? key,
    required this.isLogin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String lang = AppStrings.lang.tr(context);

    return BlocConsumer<OrdersCubit, OrdersState>(
      listener: (context, state) {},
      builder: (context, state) {
        OrdersCubit cubit = OrdersCubit.get(context);
        return Scaffold(
          drawerEnableOpenDragGesture: lang == 'English' ? false : true,
          endDrawerEnableOpenDragGesture: lang == 'English' ? true : false,
          body: Column(
            children: [
              HeaderView(
                headerText: AppStrings.controlBoard,
                isLogin: isLogin,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 1.h),
                      DividerDashboard(
                        text: AppStrings.theAccount.tr(context),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context, rootNavigator: true).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return ChangeControlPasswordView(
                                        isLogin: isLogin,
                                      );
                                    },
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Image.asset(
                                    ImageAssets.password,
                                    height: 7.h,
                                  ),
                                  Text(
                                    AppStrings.changeAccess.tr(context),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize:
                                          AppStrings.lang.tr(context) == "English" ? 12.sp : 10.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => const CancelAccountDialog(),
                                );
                              },
                              child: Column(
                                children: [
                                  Image.asset(
                                    ImageAssets.remove,
                                    height: 7.h,
                                  ),
                                  Text(
                                    AppStrings.cancelAccount.tr(context),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize:
                                          AppStrings.lang.tr(context) == "English" ? 12.sp : 10.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 1.h),
                      DividerDashboard(
                        text: AppStrings.orders.tr(context),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                StreamBuilder<List<OrderModel>>(
                                  stream: cubit.getOpenedOrder(),
                                  builder: (context, snapshot) {
                                    return DashboardItem(
                                      onTap: () {
                                        Navigator.of(context, rootNavigator: true).push(
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return OrdersView(
                                                orders: snapshot.data ?? [],
                                                title: AppStrings.openOrders,
                                              );
                                            },
                                          ),
                                        );
                                      },
                                      image: ImageAssets.choices,
                                      text: AppStrings.open.tr(context),
                                      textNum: snapshot.data == null || snapshot.data!.isEmpty
                                          ? '0'
                                          : snapshot.data!.length.toString(),
                                    );
                                  },
                                ),
                                StreamBuilder<List<OrderModel>>(
                                  stream: cubit.getToPayOrder(),
                                  builder: (context, snapshot) {
                                    return DashboardItem(
                                      onTap: () {
                                        Navigator.of(context, rootNavigator: true).push(
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return OrdersView(
                                                orders: snapshot.data ?? [],
                                                title: AppStrings.requestsNeedPayment,
                                              );
                                            },
                                          ),
                                        );
                                      },
                                      image: ImageAssets.pay,
                                      text: AppStrings.pay.tr(context),
                                      textNum: snapshot.data == null || snapshot.data!.isEmpty
                                          ? '0'
                                          : snapshot.data!.length.toString(),
                                      left: 3.w,
                                    );
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 2.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                StreamBuilder<List<OrderModel>>(
                                  stream: cubit.getFinishedOrder(),
                                  builder: (context, snapshot) {
                                    return DashboardItem(
                                      onTap: () {
                                        Navigator.of(context, rootNavigator: true).push(
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return OrdersView(
                                                title: AppStrings.expiredRequests,
                                                orders: snapshot.data ?? [],
                                              );
                                            },
                                          ),
                                        );
                                      },
                                      image: ImageAssets.done,
                                      text: AppStrings.finished.tr(context),
                                      textNum: snapshot.data == null || snapshot.data!.isEmpty
                                          ? '0'
                                          : snapshot.data!.length.toString(),
                                      right: 3.w,
                                    );
                                  },
                                ),
                                StreamBuilder<List<OrderModel>>(
                                  stream: cubit.getShipmentOrder(),
                                  builder: (context, snapshot) {
                                    return DashboardItem(
                                      onTap: () {
                                        Navigator.of(context, rootNavigator: true).push(
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return OrdersView(
                                                title: AppStrings.requestsOrders,
                                                orders: snapshot.data ?? [],
                                              );
                                            },
                                          ),
                                        );
                                      },
                                      image: ImageAssets.verified,
                                      text: AppStrings.byShipment.tr(context),
                                      textNum: snapshot.data == null || snapshot.data!.isEmpty
                                          ? '0'
                                          : snapshot.data!.length.toString(),
                                    );
                                  },
                                ),
                              ],
                            ),
                            StreamBuilder<List<OrderModel>>(
                              stream: cubit.getCanceledOrder(),
                              builder: (context, snapshot) {
                                return DashboardItem(
                                  onTap: () {
                                    Navigator.of(context, rootNavigator: true).push(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return OrdersView(
                                            orders: snapshot.data ?? [],
                                            title: AppStrings.canceledOrders,
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  image: ImageAssets.cancel,
                                  text: AppStrings.canceled.tr(context),
                                  textNum: snapshot.data == null || snapshot.data!.isEmpty
                                      ? '0'
                                      : snapshot.data!.length.toString(),
                                  right: 6.w,
                                  left: 0.0,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.h),
                      SizedBox(
                        width: double.infinity,
                        height: 18.h,
                        child: StreamBuilder<List<BannerModel>>(
                            stream: BottomNavBarCubit.get(context).getAllActiveBanners(),
                            builder: (context, snapshot) {
                              if (snapshot.data == null) {
                                return const SizedBox();
                              }
                              return Image(
                                image: NetworkImage(snapshot.data!.first.image!),
                                fit: BoxFit.cover,
                              );
                            }),
                      ),
                      SizedBox(
                        height: 3.h,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: isLogin ? const SizedBox() : const BottomWidget(),
          drawer: const DrawerView(isLogin: false),
          endDrawer: const DrawerView(isLogin: false),
        );
      },
    );
  }
}
