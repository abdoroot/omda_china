import 'package:china_omda/presentation/presentation_managers/exports.dart';

class ControlPanelView extends StatelessWidget {
  const ControlPanelView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderView(
          headerText: AppStrings.controlPanel,
          isLogin: false,
          arrowTap: () {},
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DividerDashboard(text: AppStrings.theAccount.tr(context)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return ChangeControlPasswordView(
                                  isLogin: false,
                                );
                              },
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Image.asset(ImageAssets.password, height: 7.h),
                            Text(
                              AppStrings.changeAccess.tr(context),
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: AppStrings.lang.tr(context) == "English" ? 12.sp : 10.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          children: [
                            Image.asset(ImageAssets.remove, height: 7.h),
                            Text(
                              AppStrings.users.tr(context),
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: AppStrings.lang.tr(context) == "English" ? 12.sp : 10.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  DividerDashboard(text: AppStrings.orders.tr(context)),
                  SizedBox(height: 2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StreamBuilder<List<OrderModel>>(
                        stream: null, //getOpenedOrder(),
                        builder: (context, snapshot) {
                          return DashboardItem(
                            onTap: () {
                              Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return OpenedOrdersView(openOrders: snapshot.data ?? []);
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
                        stream: null, //getToPayOrder(),
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
                      StreamBuilder<List<OrderModel>>(
                        stream: null, //getFinishedOrder(),
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
                        stream: null, //getShipmentOrder(),
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
                      StreamBuilder<List<OrderModel>>(
                        stream: null, //getCanceledOrder(),
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
                  SizedBox(height: 2.h),
                  DividerDashboard(text: AppStrings.settings.tr(context)),
                  SizedBox(height: 2.h),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          StreamBuilder<List<OrderModel>>(
                            stream: null, //getOpenedOrder(),
                            builder: (context, snapshot) {
                              return DashboardItem(
                                onTap: () {
                                  Navigator.of(context, rootNavigator: true).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return OpenedOrdersView(openOrders: snapshot.data ?? []);
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
                            stream: null, //getToPayOrder(),
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
                          StreamBuilder<List<OrderModel>>(
                            stream: null, //getFinishedOrder(),
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
                            stream: null, //getShipmentOrder(),
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
                      SizedBox(height: 1.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          StreamBuilder<List<OrderModel>>(
                            stream: null, //getToPayOrder(),
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
                          StreamBuilder<List<OrderModel>>(
                            stream: null, //getFinishedOrder(),
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
                            stream: null, //getShipmentOrder(),
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
                    ],
                  ),
                  SizedBox(height: 3.h),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
