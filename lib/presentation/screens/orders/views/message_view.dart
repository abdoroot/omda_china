import 'package:china_omda/presentation/presentation_managers/exports.dart';
import 'package:china_omda/presentation/screens/orders/views/widget/product_item.dart';

class MessageView extends StatelessWidget {
  final OrderModel model;

  const MessageView({
    Key? key,
    required this.model,
  }) : super(key: key);

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
                headerText: AppStrings.talks,
                isLogin: false,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        child:  ProductItem(model: model),
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
