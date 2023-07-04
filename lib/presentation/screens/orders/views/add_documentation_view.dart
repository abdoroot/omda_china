import 'package:china_omda/presentation/presentation_managers/exports.dart';
import 'package:china_omda/presentation/screens/orders/cubit/orders_cubit.dart';
import 'package:china_omda/presentation/screens/orders/cubit/orders_state.dart';

class AddDocumentationView extends StatelessWidget {
  const AddDocumentationView({Key? key}) : super(key: key);

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
                headerText: AppStrings.addDocument,
                isLogin: false,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      GlobalButton(
                        text: AppStrings.clickDocument.tr(context),
                        color: ColorManager.green,
                        colorText: ColorManager.white,
                        onPressed: () {},
                        height: 6.h,
                        width: 80.w,
                      ),
                      SizedBox(height: 2.h,),
                      Text(
                       AppStrings.downloadDoc.tr(context),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: ColorManager.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5.h,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        child: const OmdaTextFormFiled(
                          lableText: AppStrings.documentDescription,
                          enabled: true,
                        ),
                      ),
                      SizedBox(height: 10.h,),
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
                                  onTap: (){},
                                  buttonWidget: Text(
                                    AppStrings.implement.tr(context),
                                    style: TextStyle(
                                      color: ColorManager.white,
                                      fontSize:AppStrings.lang.tr(context) == 'English' ? null: 10.sp ,
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
          ),           drawer: const DrawerView(isLogin: false),
          endDrawer: const DrawerView(isLogin: false),
        );
      },
    );
  }
}
