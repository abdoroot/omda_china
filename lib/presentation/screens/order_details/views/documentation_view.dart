import 'package:china_omda/presentation/presentation_managers/exports.dart';
import 'package:china_omda/presentation/screens/orders/cubit/orders_cubit.dart';
import 'package:china_omda/presentation/screens/orders/cubit/orders_state.dart';
import 'package:china_omda/presentation/screens/orders/views/add_documentation_view.dart';
import 'package:china_omda/presentation/screens/orders/views/widget/documentation_widget.dart';
import 'package:china_omda/presentation/screens/orders/views/widget/product_item.dart';

class DocumentationView extends StatelessWidget {
  const DocumentationView({Key? key}) : super(key: key);

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
                headerText: AppStrings.documentation,
                isLogin: false,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: Column(
                      children: [
                        GlobalButton(
                          text: AppStrings.newDocument.tr(context),
                          color: ColorManager.black,
                          colorText: ColorManager.white,
                          onPressed: ()
                          {
                            Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return const AddDocumentationView();
                                  
                                },
                              ),
                            );
                          },
                          height: 5.h,
                          width: 45.w,
                        ),
                        const ProductItem(),
                        DividerDashboard(
                          text: AppStrings.documentation.tr(context),
                          color: ColorManager.primary,
                          colorText: ColorManager.primary,
                          fontSize: 10.sp,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppStrings.number.tr(context),
                              style: TextStyle(
                                  fontSize:
                                      AppStrings.lang.tr(context) == 'English'
                                          ? 10.sp
                                          : 9.sp,
                                  color: ColorManager.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              AppStrings.timeDate.tr(context),
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  color: ColorManager.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 6.w,
                            ),
                            Text(
                              AppStrings.description.tr(context),
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  color: ColorManager.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            Text(
                              AppStrings.runway.tr(context),
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  color: ColorManager.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              AppStrings.view.tr(context),
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  color: ColorManager.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        ListView.separated(
                          padding: EdgeInsets.only(bottom: 0.1.h),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return DocumentationWidget(
                              onTap: () {},
                            );
                          },
                          itemCount: 6,
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(
                            height: 1.5.h,
                          ),
                        ),
                      ],
                    ),
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
