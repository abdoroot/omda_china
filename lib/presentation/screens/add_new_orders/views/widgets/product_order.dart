import 'package:china_omda/presentation/presentation_managers/exports.dart';

class ProductOrderView extends StatelessWidget {
  ProductOrderView({super.key});
  final GlobalKey<FormState> productKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrdersCubit, AddOrdersState>(
      listener: (context, state) {},
      builder: (context, state) {
        AddOrdersCubit cubit = AddOrdersCubit.get(context);
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Form(
                key: productKey,
                child: Column(
                  children: [
                    OmdaTextFormFiled(
                      enabled: true,
                      lableText: AppStrings.numberOfProduct,
                      controller: cubit.numberOfProduct,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 3.h),
                    GlobalDropDownButton(
                      filled: false,
                      height: 8.h,
                      value: cubit.priceUpOfExpected,
                      onChanged: (val) {
                        cubit.selectepriceUpOfExpected(val!);
                      },
                      items: cubit.priceUpExpected,
                      width: double.infinity,
                      padding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorManager.primary,
                        ),
                      ),
                      lableText: AppStrings.priceUp.tr(context),
                    ),
                    SizedBox(height: 3.h),
                    GlobalDropDownButton(
                      filled: false,
                      height: 8.h,
                      value: cubit.productUnAvailable,
                      onChanged: (val) {
                        cubit.selecteproductUnAvailable(val!);
                      },
                      items: cubit.productNotAvailable,
                      width: double.infinity,
                      padding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorManager.primary,
                        ),
                      ),
                      lableText: AppStrings.productUnavailable.tr(context),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 2.h),
            Row(
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
                        buttonColor: ColorManager.secondary,
                        onTap: () {
                          if (productKey.currentState!.validate() &&
                              cubit.priceUpOfExpected != null &&
                              cubit.productUnAvailable != null) {
                            Navigator.pushNamed(context, Routes.productOrder2);
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
              ],
            ),
          ],
        );
      },
    );
  }
}
