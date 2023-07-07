import 'package:china_omda/presentation/presentation_managers/exports.dart';
import 'package:china_omda/presentation/screens/orders/cubit/orders_state.dart';

class OrdersItem extends StatelessWidget {
  final OrderModel orderModel;
  final int orderIndex;

  const OrdersItem({
    Key? key,
    required this.orderModel,
    required this.orderIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrdersCubit, OrdersState>(
      listener: (context, state) {},
      builder: (context, state) {
        OrdersCubit cubit = OrdersCubit.get(context);
        return Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2.5.h),
              child: Container(
                height: 18.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 1.5.w),
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: ColorManager.whitGrey,
                      offset: const Offset(2, 2),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    orderModel.products == null
                        ? SvgPicture.asset(
                            ImageAssets.splashlogo,
                            width: 20.w,
                            height: 15.h,
                            fit: BoxFit.fill,
                          )
                        : orderModel.products![0].images!.isEmpty
                            ? const SizedBox()
                            : Image.network(
                                orderModel.products![0].images![0],
                                width: 20.w,
                                height: 15.h,
                                fit: BoxFit.fill,
                              ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppStrings.referenceNumber.tr(context),
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: ColorManager.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          orderModel.orderId,
                          style: TextStyle(
                              fontSize: 15.sp,
                              height: 0.1.h,
                              color: ColorManager.red,
                              fontWeight: FontWeight.bold),
                        ),
                        orderModel.products == null
                            ? Text(
                                ' ${AppStrings.tourism.tr(context)}',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  height: 0.1.h,
                                  color: ColorManager.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            : Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                                    child: Text(
                                      '${cubit.calImages(orderModel.products == null ? [] : orderModel.products!)} ${AppStrings.images.tr(context)}',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        height: 0.1.h,
                                        color: ColorManager.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                                    child: Text(
                                      '${orderModel.products == null ? 0 : orderModel.products!.length} ${AppStrings.products.tr(context)}',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        height: 0.1.h,
                                        color: ColorManager.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                        Row(
                          children: [
                            ButtonOrders(
                              onTap: () {},
                              width: 15.w,
                              height: 4.5.h,
                              color: ColorManager.primaryGreen,
                              text: AppStrings.show.tr(context),
                              colorText: ColorManager.black,
                            ),
                            SizedBox(width: 0.7.w),
                            ButtonOrders(
                              onTap: () {
                                Navigator.of(context, rootNavigator: true).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const InvoicesView();
                                    },
                                  ),
                                );
                              },
                              width: 15.w,
                              height: 4.5.h,
                              color: ColorManager.violate,
                              text: AppStrings.invoices.tr(context),
                              colorText: ColorManager.black,
                            ),
                            SizedBox(width: 0.7.w),
                            ButtonOrders(
                              onTap: () {
                                Navigator.of(context, rootNavigator: true).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const MessageView();
                                    },
                                  ),
                                );
                              },
                              width: 17.5.w,
                              height: 4.5.h,
                              color: ColorManager.yellow,
                              text: AppStrings.talks.tr(context),
                              colorText: ColorManager.black,
                            ),
                            SizedBox(width: 0.7.w),
                            ButtonOrders(
                              onTap: () {
                                Navigator.of(context, rootNavigator: true).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const DocumentationView();
                                    },
                                  ),
                                );
                              },
                              width: 16.3.w,
                              height: 4.5.h,
                              color: ColorManager.white2,
                              text: AppStrings.docs.tr(context),
                              colorText: ColorManager.black,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 0.1.h,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.topStart,
              child: CircleAvatar(
                radius: 28,
                backgroundColor: ColorManager.primary,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${DateTime.parse(orderModel.orderDate).day}',
                      style: TextStyle(
                        fontSize: 15.sp,
                        height: 1.1,
                        color: ColorManager.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${DateTime.parse(orderModel.orderDate).month}/${DateTime.parse(orderModel.orderDate).year}',
                      style: TextStyle(
                        fontSize: 10.sp,
                        height: 1,
                        color: ColorManager.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
