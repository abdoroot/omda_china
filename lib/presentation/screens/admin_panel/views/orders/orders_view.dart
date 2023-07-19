import 'package:china_omda/presentation/presentation_managers/exports.dart';
import '../../widgets/admin_order_item.dart';

class AdminOrdersView extends StatelessWidget {
  final String title;
  final List<OrderModel> orders;

  const AdminOrdersView({
    super.key,
    required this.title,
    required this.orders,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {},
      builder: (context, state) {
        var lang = AppStrings.lang.tr(context);
        return Scaffold(
          drawerEnableOpenDragGesture: lang == 'English' ? false : true,
          endDrawerEnableOpenDragGesture: lang == 'English' ? true : false,
          backgroundColor: ColorManager.white,
          body: Column(
            children: [
              HeaderView(
                headerText: title,
                isLogin: false,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.0.w),
                    child: Column(
                      children: [
                        Text(
                          '${AppStrings.ordersNumber.tr(context)}: ${orders.length}',
                          style: TextStyle(
                            color: ColorManager.red,
                            height: 1,
                          ),
                        ),
                        ListView.builder(
                          padding: EdgeInsets.only(bottom: 0.1.h),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return AdminOrderItem(
                              orderModel: orders[index],
                            );
                          },
                          itemCount: orders.length,
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
