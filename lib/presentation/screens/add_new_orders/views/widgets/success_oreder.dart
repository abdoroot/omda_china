import 'package:china_omda/presentation/presentation_managers/exports.dart';
import 'package:china_omda/presentation/screens/add_new_orders/cubit/add_orders_cubit.dart';
import 'package:china_omda/presentation/screens/add_new_orders/cubit/add_orders_state.dart';
import 'package:lottie/lottie.dart';

class SuccessOrder extends StatelessWidget {
  const SuccessOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrdersCubit, AddOrdersState>(
      listener: (context, state) {
        AddOrdersCubit cubit = AddOrdersCubit.get(context);
        if (state is MakeTourismOrderSuccess) {
          cubit.clearTourismController();
        }
        if (state is MakeProductOrderSuccess) {
          cubit.clearProductOrderData();
        }
      },
      builder: (context, state) {
        var lang = AppStrings.lang.tr(context);
        AddOrdersCubit cubit = AddOrdersCubit.get(context);
        return Scaffold(
          drawerEnableOpenDragGesture: lang == 'English' ? false : true,
          endDrawerEnableOpenDragGesture: lang == 'English' ? true : false,
          body: Column(
            children: [
              HeaderView(
                  headerText: AppStrings.newOrders,
                  isLogin: false,
                  arrowTap: () {
                    Navigator.pushReplacementNamed(context, Routes.bottomNav);
                    cubit.clearTourismController();
                  }),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Lottie.asset(
                            'assets/json/true.json',
                            height: 15.h,
                            width: 30.w,
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            AppStrings.successOrder.tr(context),
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: ColorManager.black,
                            ),
                          ),
                          SizedBox(height: 3.h),
                          Text(
                            AppStrings.orderReference.tr(context),
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: ColorManager.black,
                            ),
                          ),
                          SizedBox(height: 3.h),
                          Text(
                            cubit.orderId.text,
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w600,
                              color: ColorManager.red,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomWidget(
            buttonColor: ColorManager.primaryGreen,
            buttonTextColor: ColorManager.black,
          ),
          drawer: const DrawerView(isLogin: false),
          endDrawer: const DrawerView(isLogin: false),
        );
      },
    );
  }
}
