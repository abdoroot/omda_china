import 'package:china_omda/presentation/presentation_managers/exports.dart';
import 'package:china_omda/presentation/screens/orders/cubit/orders_cubit.dart';
import 'package:china_omda/presentation/screens/orders/cubit/orders_state.dart';
import 'package:china_omda/presentation/screens/orders/views/payment_confirmation_view.dart';
import 'package:china_omda/presentation/screens/orders/views/widget/payment_widget.dart';

class InstallmentView extends StatelessWidget {
  const InstallmentView({Key? key}) : super(key: key);

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
                headerText: AppStrings.installment,
                isLogin: false,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
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
                                SizedBox(
                                  height: 1.5.h,
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
                        SizedBox(
                          height: 1.5.h,
                        ),
                        Image.asset(ImageAssets.lineInvoices),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        Row(
                          children: [
                            Text(
                              AppStrings.totalDirhams.tr(context),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w600,
                                  color: ColorManager.textGreen),
                            ),
                            const Spacer(),
                            Text(
                              "6,730",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.textGreen),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          AppStrings.choosePayment.tr(context),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize:lang == "English" ?9.sp : 8.sp,
                            color: ColorManager.brownText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        PaymentWidget(
                          onTap: () {},
                          title:AppStrings.payTamara.tr(context),
                          image: ImageAssets.tamara,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        PaymentWidget(
                          onTap: () {},
                          title:AppStrings.payTabby.tr(context),
                          image: ImageAssets.tabby,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        GlobalButton(
                          text: AppStrings.paymentConfirmation.tr(context),
                          color: ColorManager.brownText,
                          colorText: ColorManager.white,
                          onPressed: ()
                          {
                            Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return const PaymentConfirmationView();
                                },
                              ),
                            );
                          },
                          height: 5.h,
                          width: 45.w,
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
