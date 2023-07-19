import 'package:china_omda/presentation/presentation_managers/exports.dart';
import 'package:china_omda/presentation/screens/orders/views/widget/show_orders_images.dart';

class AdminOrderItem extends StatelessWidget {
  final OrderModel orderModel;
  const AdminOrderItem({
    super.key,
    required this.orderModel,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2.5.h),
          child: Container(
            height: 22.h,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 1.w),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
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
                                      '', //'${cubit.calImages(orderModel.products == null ? [] : orderModel.products!)} ${AppStrings.images.tr(context)}',
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
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ButtonOrders(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                              builder: (context) => ShowOrderImage(
                                products: orderModel.products,
                              ),
                            ),
                          );
                        },
                        height: 4.5.h,
                        color: ColorManager.red,
                        text: AppStrings.changeOrderStatus.tr(context),
                        colorText: ColorManager.white,
                      ),
                    ),
                    SizedBox(width: 1.w),
                    Expanded(
                      child: ButtonOrders(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return InvoicesView(orderModel: orderModel);
                              },
                            ),
                          );
                        },
                        color: ColorManager.green,
                        text: AppStrings.invoices.tr(context),
                        colorText: ColorManager.white,
                        height: 4.5.h,
                      ),
                    ),
                    SizedBox(width: 1.w),
                    Expanded(
                      child: ButtonOrders(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return MessageView(model: orderModel);
                              },
                            ),
                          );
                        },
                        height: 4.5.h,
                        width: 10.w,
                        color: ColorManager.blueBotton,
                        text: AppStrings.talks.tr(context),
                        colorText: ColorManager.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 0.1.h)
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
  }
}
