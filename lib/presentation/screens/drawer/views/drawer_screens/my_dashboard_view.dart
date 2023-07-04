import 'package:china_omda/models/order_model.dart';
import 'package:china_omda/presentation/presentation_managers/exports.dart';
import 'package:china_omda/presentation/screens/orders/cubit/orders_cubit.dart';
import 'package:china_omda/presentation/screens/orders/cubit/orders_state.dart';

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
                                              return const OpenOrderView();
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
                                              return const RequestsNeedPaymentView();
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
                                              return const ExpiredRequestsView();
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
                                              return const RequestsOrderView();
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
                                          return const CanceledOrdersView();
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
                        child: const Image(
                          image: NetworkImage(
                              'https://img.freepik.com/premium-vector/landing-page-laptop-information-website-banner-message-vector_3482-7061.jpg?size=626&ext=jpg&ga=GA1.2.1666381349.1685955061&semt=robertav1_2_sidr'),
                          fit: BoxFit.cover,
                        ),
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
