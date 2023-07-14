import 'package:china_omda/presentation/presentation_managers/exports.dart';

class ShowOrderImage extends StatelessWidget {
  final List<Product>? products;

  const ShowOrderImage({
    super.key,
    required this.products,
  });

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
                headerText: AppStrings.view,
                isLogin: false,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Column(
                          children: [
                            if (products == null)
                              SvgPicture.asset(
                                ImageAssets.splashlogo,
                                height: 30.h,
                                width: double.maxFinite,
                                fit: BoxFit.fill,
                              ),
                            if (products != null)
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, productIndex) {
                                  return Column(
                                    children: [
                                      Text(
                                        '${AppStrings.products.tr(context)} (${productIndex + 1})',
                                        style: TextStyle(
                                          color: ColorManager.black,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      ListView.separated(
                                        shrinkWrap: true,
                                        physics: const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) => Image.network(
                                          products![productIndex].images![index],
                                          height: 20.h,
                                          width: double.maxFinite,
                                          fit: BoxFit.fill,
                                        ),
                                        separatorBuilder: (context, index) => SizedBox(height: 2.h),
                                        itemCount: products![productIndex].images!.length,
                                      ),
                                    ],
                                  );
                                },
                                separatorBuilder: (context, index) => SizedBox(height: 3.h),
                                itemCount: products!.length,
                              ),
                          ],
                        ),
                      ),
                    ],
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
