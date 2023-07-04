import 'package:china_omda/presentation/presentation_managers/exports.dart';

class ProductOrderTwo extends StatelessWidget {
  const ProductOrderTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrdersCubit, AddOrdersState>(
      listener: (context, state) {},
      builder: (context, state) {
        var lang = AppStrings.lang.tr(context);
        AddOrdersCubit cubit = AddOrdersCubit.get(context);
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
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.w),
                        child: Column(
                          children: [
                            SizedBox(height: 3.h),
                            GlobalDropDownButton(
                              filled: false,
                              height: 8.h,
                              value: cubit.notReturn,
                              onChanged: (val) {
                                cubit.selectenotReturn(val!);
                              },
                              items: cubit.productNotReturn,
                              width: double.infinity,
                              padding: EdgeInsets.zero,
                              lableText: AppStrings.sellerNotReturn.tr(context),
                            ),
                            SizedBox(height: 3.h),
                            GlobalDropDownButton(
                              filled: false,
                              height: 8.h,
                              value: cubit.takeTime,
                              onChanged: (val) {
                                cubit.selectetakeTime(val!);
                              },
                              items: cubit.productTakeTime,
                              width: double.infinity,
                              padding: EdgeInsets.zero,
                              lableText: AppStrings.productTakeTime.tr(context),
                            ),
                            SizedBox(height: 3.h),
                            GlobalDropDownButton(
                              filled: false,
                              height: 8.h,
                              value: cubit.containBrand,
                              onChanged: (val) {
                                cubit.selectecontainBrand(val!);
                              },
                              items: cubit.productContainBrand,
                              width: double.infinity,
                              padding: EdgeInsets.zero,
                              lableText: AppStrings.productContainBrand.tr(context),
                            ),
                            SizedBox(height: 3.h),
                            GlobalDropDownButton(
                              filled: false,
                              height: 8.h,
                              value: cubit.containBatteries,
                              onChanged: (val) {
                                cubit.selectecontainBatteries(val!);
                              },
                              items: cubit.productContainBatteries,
                              width: double.infinity,
                              padding: EdgeInsets.zero,
                              lableText: AppStrings.productContainBatteries.tr(context),
                            ),
                            SizedBox(height: 3.h),
                            GlobalDropDownButton(
                              filled: false,
                              height: 8.h,
                              value: cubit.preview,
                              onChanged: (val) {
                                cubit.selectePreview(val!);
                              },
                              items: cubit.productPreview,
                              width: double.infinity,
                              padding: EdgeInsets.zero,
                              lableText: AppStrings.inspectionProduct.tr(context),
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
                                  onTap: () {
                                    if (cubit.notReturn != null &&
                                        cubit.takeTime != null &&
                                        cubit.containBrand != null &&
                                        cubit.containBatteries != null &&
                                        cubit.preview != null) {
                                      cubit.initControllers();
                                      Navigator.pushNamed(context, Routes.productOrderDetails);
                                    } else {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            AppStrings.emptyField.tr(context),
                                          ),
                                          backgroundColor: ColorManager.primary,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          behavior: SnackBarBehavior.floating,
                                        ),
                                      );
                                    }
                                  },
                                  buttonWidget: Text(
                                    AppStrings.next.tr(context),
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
