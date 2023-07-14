import 'package:china_omda/presentation/presentation_managers/exports.dart';

class PaymentGatesView extends StatelessWidget {
  const PaymentGatesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {},
      builder: (context, state) {
        var lang = AppStrings.lang.tr(context);
        return Scaffold(
          drawerEnableOpenDragGesture: lang == 'English' ? false : true,
          endDrawerEnableOpenDragGesture: lang == 'English' ? true : false,
          backgroundColor: ColorManager.white,
          body: Column(
            children: [
              const HeaderView(
                headerText: AppStrings.paymentGateways,
                isLogin: false,
              ),
              SizedBox(height: 5.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 13.h,
                      width: double.infinity,
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'مفعل',
                                  ),
                                  Switch(
                                    value: true,
                                    onChanged: (value) {},
                                  ),
                                ],
                              ),
                              Image.asset(ImageAssets.tamara),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    SizedBox(
                      height: 13.h,
                      width: double.infinity,
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'غير مفعل',
                                  ),
                                  Switch(
                                    value: true,
                                    onChanged: (value) {},
                                  ),
                                ],
                              ),
                              Image.asset(ImageAssets.tabby),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 3.h),
              GlobalButton(
                text: 'save',
                color: ColorManager.secondary,
                height: 5.h,
                width: 50.w,
                colorText: ColorManager.white,
                raduis: 20,
                onPressed: () {},
              ),
            ],
          ),
          bottomNavigationBar: const BottomWidget(isAdmin: true),
          drawer: const DrawerView(isLogin: false, isAdmin: true),
          endDrawer: const DrawerView(isLogin: false, isAdmin: true),
        );
      },
    );
  }
}
