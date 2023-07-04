import 'package:china_omda/presentation/presentation_managers/exports.dart';
import 'package:china_omda/presentation/screens/orders/cubit/orders_cubit.dart';
import 'package:china_omda/presentation/screens/orders/cubit/orders_state.dart';
import 'package:china_omda/presentation/screens/orders/views/pay_bill_view.dart';
import 'package:china_omda/presentation/screens/orders/views/installment_view.dart';
import 'package:china_omda/presentation/screens/orders/views/widget/button_orders.dart';

class DetailsInvoicesView extends StatelessWidget {
  const DetailsInvoicesView({Key? key}) : super(key: key);

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
                    padding:  EdgeInsets.symmetric(horizontal: 2.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${AppStrings.invoiceNumber.tr(context)} : 1001",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          AppStrings.mediationNumber.tr(context),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${AppStrings.date.tr(context)} : 22/10/2023",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "202316123456",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      AppStrings.condition.tr(context),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 11.sp,
                                          fontWeight: FontWeight.w400,
                                          color: ColorManager.red
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2.5.w,
                                    ),
                                    Text(
                                      AppStrings.awaitingPayment.tr(context),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w400,
                                        color: ColorManager.red
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Text(
                              "${AppStrings.time.tr(context)} : 14:30:28",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 1.5.h,),
                        Image.asset(ImageAssets.lineInvoices),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
                          child: Row(
                            children: [
                              Text(
                                AppStrings.description.tr(context),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  // fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                AppStrings.value.tr(context),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  // fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: 8.w,),
                              Text(
                                AppStrings.price.tr(context),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  // fontWeight: FontWeight.w600,
                                ),
                              ),

                            ],
                          ),
                        ),
                        Image.asset(ImageAssets.lineInvoices),
                        ListView.separated(
                            padding: EdgeInsets.only(bottom: 0.1.h),
                            shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return  Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 2.w),
                              child: Row(
                                children: [
                                  Text(
                                    "رحلة بالحافلة",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w700,
                                        color: ColorManager.lableGrey
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "3",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700,
                                        color: ColorManager.lableGrey
                                    ),
                                  ),
                                  SizedBox(width: 8.w,),
                                  Text(
                                    "6000",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700,
                                        color: ColorManager.lableGrey
                                    ),
                                  ),

                                ],
                              ),
                            );
                          },
                          itemCount: 3,
                          separatorBuilder: (BuildContext context, int index) => const Divider()
                        ),
                        SizedBox(height: 4.h,),
                        Image.asset(ImageAssets.lineInvoices),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
                          child: Row(
                            children: [
                              Text(
                                AppStrings.totalDirhams.tr(context),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w800,
                                  color: ColorManager.textGreen
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "6,730",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold,
                                    color: ColorManager.textGreen
                                ),
                              ),

                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.5.h,
                        ),
                        Container(
                          height: 0.1.h,
                          color:ColorManager.primary,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ButtonOrders(
                              onTap: ()
                              {
                                Navigator.of(context, rootNavigator: true).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const PayBillView();
                                    },
                                  ),
                                );
                              },
                              width: 22.w,
                              height:4.2.h,
                              color: ColorManager.primaryGreen,
                              text: AppStrings.payNow.tr(context),
                              colorText: ColorManager.black,
                            ),
                            ButtonOrders(
                              onTap: ()
                              {
                                Navigator.of(context, rootNavigator: true).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const InstallmentView();
                                    },
                                  ),
                                );
                              },
                              width: 22.w,
                              height:4.2.h,
                              color: ColorManager.blue,
                              text: AppStrings.installment.tr(context),
                              colorText: ColorManager.black,
                            ),
                            ButtonOrders(
                              onTap: () {},
                              width: 22.w,
                              height:4.2.h,
                              color: ColorManager.yellow,
                              text: AppStrings.download.tr(context),
                              colorText: ColorManager.black,
                            ),
                          ],
                        )
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
