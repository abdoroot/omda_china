import 'package:china_omda/presentation/presentation_managers/exports.dart';
import 'package:china_omda/presentation/screens/orders/views/documentation_view.dart';
import 'package:china_omda/presentation/screens/orders/views/invoices_view.dart';
import 'package:china_omda/presentation/screens/orders/views/message_view.dart';
import 'package:china_omda/presentation/screens/orders/views/widget/button_orders.dart';

class OrdersItem extends StatelessWidget {

  const OrdersItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(vertical: 2.5.h),
            child: Container(
              height: 18.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: ColorManager.whitGrey,
                    offset: const Offset(2, 2),
                    blurRadius:5,
                  ),
                ],
                // boxShadow:
              ),
              child: Row(
                children: [
                  Image.asset('assets/images/image 21.png',
                      width: 30.w, fit: BoxFit.cover),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.referenceNumber.tr(context),
                        style: TextStyle(
                            fontSize: 13.sp,
                            color: ColorManager.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '202316123456',
                        style: TextStyle(
                            fontSize: 15.sp,
                            height: 0.1.h,
                            color: ColorManager.red,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding:
                            EdgeInsets.symmetric(horizontal: 5.w),
                            child: Text(
                              '3 ${AppStrings.images.tr(context)}',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  height: 0.1.h,
                                  color: ColorManager.black,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding:
                            EdgeInsets.symmetric(horizontal: 5.w),
                            child: Text(
                              '12 ${AppStrings.products.tr(context)}',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  height: 0.1.h,
                                  color: ColorManager.black,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                       Row(children: [
                        ButtonOrders(
                          onTap: () {},
                          width: 15.w,
                          height: 4.5.h,
                          color: ColorManager.primaryGreen,
                          text: AppStrings.show.tr(context),
                          colorText: ColorManager.black,
                        ),
                        SizedBox(
                          width: 0.7.w,
                        ),
                        ButtonOrders(
                          onTap: ()
                          {
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
                        SizedBox(
                          width: 0.7.w,
                        ),
                        ButtonOrders(
                          onTap: ()
                          {
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
                        SizedBox(
                          width: 0.7.w,
                        ),
                        ButtonOrders(
                          onTap: ()
                          {
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
                      ]),
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
                      '17',
                      style: TextStyle(
                          fontSize: 15.sp,
                          height: 0.1.h,
                          color: ColorManager.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '05/2023',
                      style: TextStyle(
                          fontSize: 10.sp,
                          height: 0.1.h,
                          color: ColorManager.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
          ),
        ]);
  }
}
