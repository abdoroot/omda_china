import 'package:china_omda/presentation/presentation_managers/exports.dart';

class ProductOrderDetails extends StatelessWidget {
  const ProductOrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrdersCubit, AddOrdersState>(
      listener: (context, state) {},
      builder: (context, state) {
        AddOrdersCubit cubit = AddOrdersCubit.get(context);
        var lang = AppStrings.lang.tr(context);
        print(cubit.controllers.length);
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
                            Text(
                              AppStrings.productDetails.tr(context),
                              style: TextStyle(
                                color: ColorManager.secondary,
                                height: 1,
                              ),
                            ),
                            SizedBox(height: 0.5.h),
                            GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 1.0.w,
                                mainAxisSpacing: 1.0.h,
                                mainAxisExtent: 5.h,
                              ),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    cubit.changeProductIndex(index);
                                  },
                                  child: Container(
                                    width: 12.w,
                                    decoration: BoxDecoration(
                                      color: cubit.productIndex == index
                                          ? ColorManager.primary
                                          : Colors.transparent,
                                      border: Border.all(
                                        color: ColorManager.black,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        AppStrings.lang.tr(context) != 'English'
                                            ? 'Product(${index + 1})'
                                            : 'المنتج(${index + 1})',
                                      ),
                                    ),
                                  ),
                                );
                              },
                              itemCount: int.tryParse(cubit.numberOfProduct.text),
                            ),
                            SizedBox(height: 2.h),
                            GlobalButton(
                              text: AppStrings.uploadProductImages.tr(context),
                              color: ColorManager.green,
                              height: 7.h,
                              width: double.infinity,
                              colorText: ColorManager.white,
                              onPressed: () async {
                                await cubit.pickAllImage().then((value) async {
                                  try {
                                    List<String> uploadedImageUrls =
                                        await cubit.uploadImages(cubit.images);
                                    for (int i = 0; i < uploadedImageUrls.length; i++) {
                                      cubit.imagesForAll[cubit.productIndex]
                                          .add(uploadedImageUrls[i]);
                                      print('Uploaded image URL: ${uploadedImageUrls[i]}');
                                      print(
                                          'Current image URL in imagesForAll: ${cubit.imagesForAll[cubit.productIndex][i]}');
                                    }
                                  } catch (e) {
                                    print('Error uploading images: $e');
                                  }
                                  cubit.images = [];
                                });
                                // await cubit.pickAllImage().then((value) async {
                                //   await cubit.uploadImages(cubit.images).then((value) {
                                //     for (int i = 0; i < value.length; i++) {
                                //       cubit.imagesForAll[cubit.productIndex].add(value[i]);
                                //       print(value[i]);
                                //       print('/////////');
                                //       print(cubit.imagesForAll[cubit.productIndex][i]);
                                //     }
                                //   });
                                //   cubit.images = [];
                                // });
                              },
                            ),
                            Text(
                              AppStrings.uploadfiveImage.tr(context),
                              style: TextStyle(
                                color: ColorManager.black,
                              ),
                            ),
                            SizedBox(height: 2.h),
                            OmdaTextFormFiled(
                              enabled: true,
                              lableText: AppStrings.productLink,
                              controller: cubit.controllers[cubit.productIndex][0],
                              keyboardType: TextInputType.url,
                            ),
                            SizedBox(height: 3.h),
                            Row(
                              children: [
                                Expanded(
                                  child: OmdaTextFormFiled(
                                    enabled: true,
                                    lableText: AppStrings.quantity,
                                    controller: cubit.controllers[cubit.productIndex][1],
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                                SizedBox(width: 2.w),
                                Expanded(
                                  child: OmdaTextFormFiled(
                                    enabled: true,
                                    lableText: AppStrings.expectedPrice,
                                    controller: cubit.controllers[cubit.productIndex][2],
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 3.h),
                            Row(
                              children: [
                                Expanded(
                                  child: OmdaTextFormFiled(
                                    enabled: true,
                                    lableText: AppStrings.productSize,
                                    controller: cubit.controllers[cubit.productIndex][3],
                                    keyboardType: TextInputType.text,
                                  ),
                                ),
                                SizedBox(width: 2.w),
                                Expanded(
                                  child: OmdaTextFormFiled(
                                    enabled: true,
                                    lableText: AppStrings.productColor,
                                    controller: cubit.controllers[cubit.productIndex][4],
                                    keyboardType: TextInputType.text,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 2.h),
                            OmdaTextArea(
                              enabled: true,
                              lableText: AppStrings.anotherDetails,
                              controller: cubit.controllers[cubit.productIndex][5],
                              keyboardType: TextInputType.multiline,
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
                                    List<Product> products = [];
                                    for (var i = 0; i < cubit.controllers.length; i++) {
                                      List<TextEditingController> productControllers =
                                          cubit.controllers[i];
                                      Product product = Product();

                                      for (var j = 0; j < productControllers.length; j++) {
                                        TextEditingController controller = productControllers[j];
                                        String productDetail = controller.text;
                                        if (j == 0) {
                                          product.urlForProduct = productDetail;
                                        } else if (j == 1) {
                                          product.quantity = productDetail;
                                        } else if (j == 2) {
                                          product.expectedPriceForOne = productDetail;
                                        } else if (j == 3) {
                                          product.size = productDetail;
                                        } else if (j == 4) {
                                          product.color = productDetail;
                                        } else if (j == 5) {
                                          product.anotherDetails = productDetail;
                                        }
                                      }
                                      product.images = cubit.imagesForAll[i];

                                      products.add(product);
                                    }
                                    cubit.products = products;
                                    Navigator.pushNamed(context, Routes.confirmProductOrder);
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
