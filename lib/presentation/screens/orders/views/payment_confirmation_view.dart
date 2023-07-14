import 'package:china_omda/presentation/presentation_managers/exports.dart';

class PaymentConfirmationView extends StatelessWidget {
  const PaymentConfirmationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrdersCubit, OrdersState>(
      listener: (context, state) {},
      builder: (context, state) {
        //OrdersCubit cubit = OrdersCubit.get(context);
        String lang = AppStrings.lang.tr(context);
        return Scaffold(
          backgroundColor: ColorManager.white,
          drawerEnableOpenDragGesture: lang == 'English' ? false : true,
          endDrawerEnableOpenDragGesture: lang == 'English' ? true : false,
          body: Column(
            children: [
              const HeaderView(
                headerText: AppStrings.paymentConfirmation,
                isLogin: false,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(height: 10.h,),
                      Image.asset(ImageAssets.verifiedPayment),
                      Text(
                        AppStrings.paymentSuccessfully.tr(context),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: ColorManager.black,
                          fontWeight: FontWeight.bold,
                        ),
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
          ),          drawer: const DrawerView(isLogin: false),
          endDrawer: const DrawerView(isLogin: false),
        );
      },
    );
  }
}
