import 'package:china_omda/presentation/presentation_managers/exports.dart';

class ConfirmProductOrder extends StatelessWidget {
  const ConfirmProductOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrdersCubit, AddOrdersState>(
      listener: (context, state) {},
      builder: (context, state) {
        var lang = AppStrings.lang.tr(context);
        AddOrdersCubit cubit = AddOrdersCubit.get(context);
        cubit.orderDate.text = Jiffy.now().format(pattern: 'dd/MM/yyyy');
        cubit.orderTypeController.text =
            cubit.orderType == null ? '' : cubit.orderType!.tr(context);
        return Scaffold(
          drawerEnableOpenDragGesture: lang == 'English' ? false : true,
          endDrawerEnableOpenDragGesture: lang == 'English' ? true : false,
          body: Column(
            children: [
              const HeaderView(
                headerText: AppStrings.orderRequest,
                isLogin: false,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6.w),
                            child: Column(
                              children: [
                                Text(
                                  AppStrings.viewOrder.tr(context),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: ColorManager.secondary,
                                    fontSize: 13.sp,
                                    height: 1.1,
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                Row(
                                  children: [
                                    Expanded(
                                      child: OmdaTextFormFiled(
                                        enabled: false,
                                        lableText: AppStrings.orderNumber,
                                        controller: cubit.orderId,
                                        contentTextColor: ColorManager.red,
                                      ),
                                    ),
                                    SizedBox(width: 2.w),
                                    Expanded(
                                      child: OmdaTextFormFiled(
                                        enabled: false,
                                        lableText: AppStrings.orderDate,
                                        controller: cubit.orderDate,
                                        contentTextColor: ColorManager.red,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 2.h),
                                StreamBuilder<UserModel>(
                                  stream: DrawerCubit.get(context).getUserData(),
                                  builder: (context, snapshot) {
                                    cubit.orderUserName.text =
                                        snapshot.data == null ? '' : snapshot.data!.name!;
                                    return OmdaTextFormFiled(
                                      enabled: false,
                                      lableText: AppStrings.name,
                                      controller: cubit.orderUserName,
                                    );
                                  },
                                ),
                                SizedBox(height: 2.h),
                                OmdaTextFormFiled(
                                  enabled: false,
                                  lableText: AppStrings.orderType,
                                  controller: cubit.orderTypeController,
                                ),
                                SizedBox(height: 2.h),
                                OmdaTextFormFiled(
                                  enabled: false,
                                  lableText: AppStrings.numberOfProduct,
                                  controller: cubit.numberOfProduct,
                                  keyboardType: TextInputType.number,
                                ),
                                SizedBox(height: 3.h),
                                OmdaTextFormFiled(
                                  enabled: false,
                                  lableText: AppStrings.priceUp,
                                  controller: TextEditingController(
                                    text: cubit.priceUpOfExpected == null
                                        ? ''
                                        : cubit.priceUpOfExpected!.tr(context),
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                                SizedBox(height: 3.h),
                                OmdaTextFormFiled(
                                  enabled: false,
                                  lableText: AppStrings.productUnavailable,
                                  controller: TextEditingController(
                                      text: cubit.productUnAvailable!.tr(context)),
                                  keyboardType: TextInputType.number,
                                ),
                                SizedBox(height: 3.h),
                                OmdaTextFormFiled(
                                  enabled: false,
                                  lableText: AppStrings.sellerNotReturn,
                                  controller:
                                      TextEditingController(text: cubit.notReturn!.tr(context)),
                                  keyboardType: TextInputType.number,
                                ),
                                SizedBox(height: 3.h),
                                OmdaTextFormFiled(
                                  enabled: false,
                                  lableText: AppStrings.productTakeTime,
                                  controller:
                                      TextEditingController(text: cubit.takeTime!.tr(context)),
                                  keyboardType: TextInputType.number,
                                ),
                                SizedBox(height: 3.h),
                                OmdaTextFormFiled(
                                  enabled: false,
                                  lableText: AppStrings.productContainBrand,
                                  controller:
                                      TextEditingController(text: cubit.containBrand!.tr(context)),
                                  keyboardType: TextInputType.number,
                                ),
                                SizedBox(height: 3.h),
                                OmdaTextFormFiled(
                                  enabled: false,
                                  lableText: AppStrings.productContainBatteries,
                                  controller: TextEditingController(
                                      text: cubit.containBatteries!.tr(context)),
                                  keyboardType: TextInputType.number,
                                ),
                                SizedBox(height: 3.h),
                                OmdaTextFormFiled(
                                  enabled: false,
                                  lableText: AppStrings.inspectionProduct,
                                  controller:
                                      TextEditingController(text: cubit.preview!.tr(context)),
                                  keyboardType: TextInputType.number,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Stack(
                                children: [
                                  SvgPicture.asset(
                                    AppStrings.lang.tr(context) == 'English'
                                        ? ImageAssets.circlePrimeRight
                                        : ImageAssets.circlePrimeLeft,
                                  ),
                                  Positioned(
                                    top: 0,
                                    bottom: 0,
                                    left: AppStrings.lang.tr(context) == 'English' ? 2.w : null,
                                    right: AppStrings.lang.tr(context) == 'English' ? null : 2.w,
                                    child: CircleButton(
                                      buttonColor: ColorManager.primaryGreen,
                                      onTap: () {
                                        cubit
                                            .makeProductOrder(
                                          ordrId: cubit.orderId.text,
                                          orederType: cubit.orderTypeController.text,
                                          userName: cubit.orderUserName.text,
                                          numberOfProduct: cubit.numberOfProduct.text,
                                          inspectionProductsBeforeSend: cubit.preview ?? '',
                                          priceUpOfExpected: cubit.priceUpOfExpected ?? '',
                                          productContainBatteries: cubit.containBatteries ?? '',
                                          productContainsBranded: cubit.containBrand ?? '',
                                          productTakeTime: cubit.takeTime ?? '',
                                          productUnavailable: cubit.productUnAvailable ?? '',
                                          sellerNotReturnProduct: cubit.notReturn ?? '',
                                          products: cubit.products,
                                        )
                                            .then(
                                          (value) {
                                            Navigator.pushNamed(context, Routes.successOrder);
                                            cubit.clearProductOrderData();
                                          },
                                        );
                                      },
                                      buttonWidget: Text(
                                        AppStrings.confirm.tr(context),
                                        style: TextStyle(
                                          color: ColorManager.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Stack(
                                children: [
                                  SvgPicture.asset(
                                    AppStrings.lang.tr(context) == 'English'
                                        ? ImageAssets.circlePrimeLeft
                                        : ImageAssets.circlePrimeRight,
                                  ),
                                  Positioned(
                                    top: 0,
                                    bottom: 0,
                                    left: AppStrings.lang.tr(context) == 'English' ? null : 2.w,
                                    right: AppStrings.lang.tr(context) == 'English' ? 2.w : null,
                                    child: CircleButton(
                                      buttonColor: ColorManager.secondary,
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      buttonWidget: Text(
                                        AppStrings.previous.tr(context),
                                        style: TextStyle(
                                          color: ColorManager.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
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
