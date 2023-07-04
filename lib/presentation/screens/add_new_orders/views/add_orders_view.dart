import 'package:china_omda/presentation/presentation_managers/exports.dart';

class AddOrderView extends StatelessWidget {
  const AddOrderView({super.key});

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
              HeaderView(
                headerText: AppStrings.newOrders,
                isLogin: false,
                arrowTap: () {
                  Navigator.of(context).pop();
                  cubit.clearTourismController();
                },
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.w),
                        child: Column(
                          children: [
                            Text(
                              AppStrings.simple.tr(context),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: ColorManager.secondary,
                                fontSize: 13.sp,
                                height: 1.1,
                              ),
                            ),
                            SizedBox(height: 2.h),
                            OmdaTextFormFiled(
                              enabled: false,
                              lableText: AppStrings.orderNumber,
                              width: 50.w,
                              controller: cubit.orderId,
                              contentTextColor: ColorManager.red,
                            ),
                            SizedBox(height: 2.h),
                            GlobalDropDownButton(
                              filled: false,
                              height: 8.h,
                              hintText: AppStrings.selecteOrderType,
                              value: cubit.orderType,
                              onChanged: (val) {
                                cubit.selecteOrderType(val!);
                              },
                              items: cubit.option,
                              valueSize: 12.sp,
                              width: double.infinity,
                              padding: EdgeInsets.zero,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorManager.primary,
                                ),
                              ),
                              lableText: AppStrings.orderType.tr(context),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 2.h),
                      if (cubit.orderType == AppStrings.tourism) TourismOrder(),
                      if (cubit.orderType == AppStrings.orderProducts) ProductOrderView(),
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
