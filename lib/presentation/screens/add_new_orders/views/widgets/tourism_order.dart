import 'package:china_omda/presentation/presentation_managers/exports.dart';

class TourismOrder extends StatelessWidget {
  final GlobalKey<FormState> orderKey = GlobalKey<FormState>();
  TourismOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrdersCubit, AddOrdersState>(
      listener: (context, state) {
        AddOrdersCubit cubit = AddOrdersCubit.get(context);
        if (state is MakeTourismOrderSuccess) {
          cubit.clearTourismController();
        }
      },
      builder: (context, state) {
        AddOrdersCubit cubit = AddOrdersCubit.get(context);
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Column(
                children: [
                  Form(
                    key: orderKey,
                    child: OmdaTextFormFiled(
                      enabled: true,
                      lableText: AppStrings.passengers,
                      controller: cubit.passengersNumber,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  OmdaTextFormFiled(
                    enabled: true,
                    lableText: AppStrings.interests,
                    controller: cubit.interestController,
                    validator: (p0) {
                      return null;
                    },
                    suffixIcon: IconButton(
                      onPressed: () {
                        if (cubit.interestController.text.isNotEmpty) {
                          cubit.addInterest(cubit.interestController.text);
                        }
                      },
                      icon: Icon(
                        Icons.add,
                        color: ColorManager.primary,
                      ),
                    ),
                    onFieldSubmitted: (value) {
                      if (cubit.interestController.text.isNotEmpty) {
                        cubit.addInterest(value);
                      }
                    },
                  ),
                ],
              ),
            ),
            Wrap(
              spacing: 8.0,
              children: cubit.interests.map((interest) {
                return Chip(
                  label: Text(interest),
                  backgroundColor: ColorManager.primary,
                  onDeleted: () {
                    cubit.removeInterest(interest);
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 2.h),
            Text(
              AppStrings.orderProductsDetails.tr(context),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorManager.secondary,
                fontSize: 13.sp,
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
                          if (orderKey.currentState!.validate() && cubit.interests.isNotEmpty) {
                            Navigator.pushNamed(context, Routes.confirmTourismOrder);
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
