import 'package:china_omda/presentation/presentation_managers/exports.dart';
import 'package:china_omda/presentation/screens/orders/cubit/orders_state.dart';
import 'package:china_omda/presentation/screens/orders/views/details_invoices_view.dart';
import 'package:china_omda/presentation/screens/orders/views/widget/order_bills_widget.dart';
import 'package:china_omda/presentation/screens/orders/views/widget/product_item.dart';

class InvoicesView extends StatelessWidget {
  const InvoicesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrdersCubit, OrdersState>(
      listener: (context, state) {},
      builder: (context, state) {
        //OrdersCubit cubit = OrdersCubit.get(context);
        String lang = AppStrings.lang.tr(context);
        return Scaffold(
          drawerEnableOpenDragGesture: lang == 'English' ? false : true,
          endDrawerEnableOpenDragGesture: lang == 'English' ? true : false,
          body: Column(
            children: [
              const HeaderView(
                headerText: AppStrings.invoices,
                isLogin: false,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: Column(
                      children: [
                        const ProductItem(),
                        DividerDashboard(
                          text: AppStrings.orderBills.tr(context),
                          color: ColorManager.primary,
                          fontSize: 12.sp,
                          colorText: ColorManager.primary,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppStrings.number.tr(context),
                              style: TextStyle(
                                  fontSize: AppStrings.lang.tr(context) == 'English' ? 10.sp : 9.sp,
                                  color: ColorManager.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              AppStrings.date.tr(context),
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  color: ColorManager.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            Text(
                              AppStrings.description.tr(context),
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  color: ColorManager.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            Text(
                              AppStrings.value.tr(context),
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  color: ColorManager.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              AppStrings.condition.tr(context),
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  color: ColorManager.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              AppStrings.view.tr(context),
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  color: ColorManager.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        ListView.separated(
                          padding: EdgeInsets.only(bottom: 0.1.h),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return OrderBillsWidget(onTap: ()
                            {
                              Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const DetailsInvoicesView();
                                  },
                                ),
                              );
                            },);
                          },
                          itemCount: 6,
                          separatorBuilder: (BuildContext context, int index) => SizedBox(
                            height: 1.5.h,
                          ),
                        ),
                      ],
                    ),
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
