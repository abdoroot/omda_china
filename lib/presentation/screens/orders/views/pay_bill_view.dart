import 'package:china_omda/presentation/presentation_managers/exports.dart';

class PayBillView extends StatelessWidget {

  const PayBillView({Key? key}) : super(key: key);

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
                headerText: AppStrings.payBill,
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
                        SizedBox(height: 4.h,),
                        Text(
                          AppStrings.paymentCardNumber.tr(context),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 8.sp,
                            color: ColorManager.grey2,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        GlobalTextFormField(
                          textController: null,
                          textInputType: TextInputType.number,
                          decoration:InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 0.5.h),
                              hintText: 'XXXX XXXX XXXX 8014',
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: ColorManager.grey2)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: ColorManager.grey2))
                          )
                        ),
                        SizedBox(height: 1.5.h,),
                        Text(
                          AppStrings.theCard.tr(context),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 8.sp,
                            color: ColorManager.grey2,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        GlobalTextFormField(
                          textController: null,
                          textInputType: TextInputType.name,
                          decoration:InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 0.5.h),
                              hintText: 'Kelly OLiver',
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: ColorManager.grey2)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: ColorManager.grey2))
                          )
                        ),
                        SizedBox(height: 1.5.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    'CVV',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 8.sp,
                                      color: ColorManager.grey2,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  GlobalTextFormField(
                                      textController: null,
                                      textInputType: TextInputType.number,
                                      decoration:InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(vertical: 0.5.h),
                                          hintText: 'XXX',
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: ColorManager.grey2)),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: ColorManager.grey2))
                                      )
                                  ),

                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    AppStrings.expiryDate.tr(context),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 8.sp,
                                      color: ColorManager.grey2,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  GlobalTextFormField(
                                      textController: null,
                                      textInputType: TextInputType.datetime,
                                      decoration:InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(vertical: 0.5.h),
                                          hintText: '08/21',
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: ColorManager.grey2)),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(color: ColorManager.grey2))
                                      )
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.5.h,),
                        const Divider(),
                        Row(
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
                        SizedBox(height: 2.h,),
                        GlobalButton(
                          text: AppStrings.paymentConfirmation.tr(context),
                          color: ColorManager.brownText,
                          colorText: ColorManager.white,
                          onPressed: ()
                          {
                            // Navigator.of(context, rootNavigator: true).push(
                            //   MaterialPageRoute(
                            //     builder: (context) {
                            //       return const PaymentConfirmationView();
                            //     },
                            //   ),
                            // );
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
