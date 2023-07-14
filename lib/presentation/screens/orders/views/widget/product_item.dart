import 'package:china_omda/presentation/presentation_managers/exports.dart';

class ProductItem extends StatelessWidget {
  final OrderModel model;

  const ProductItem({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 2.5.h),
        child: Container(
          height: 18.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: ColorManager.whitGrey,
                offset: const Offset(2, 2),
                blurRadius: 5,
              ),
            ],
            // boxShadow:
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              model.products == null
                  ? SvgPicture.asset(
                      ImageAssets.splashlogo,
                      width: 20.w,
                      height: 15.h,
                      fit: BoxFit.fill,
                    )
                  : Image.network(
                      model.products![0].images![0],
                      width: 30.w,
                      height: 15.h,
                      fit: BoxFit.fill,
                    ),
              Column(
                children: [
                  Text(
                    AppStrings.referenceNumber.tr(context),
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: ColorManager.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    model.orderId,
                    style: TextStyle(
                        fontSize: 15.sp,
                        height: 0.1.h,
                        color: ColorManager.red,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 1.h),
                  model.products == null
                      ? Text(
                          ' ${AppStrings.tourism.tr(context)}',
                          style: TextStyle(
                            fontSize: 12.sp,
                            height: 0.1.h,
                            color: ColorManager.black,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              child: Text(
                                '${OrdersCubit.get(context).calImages(model.products == null ? [] : model.products!)} ${AppStrings.images.tr(context)}',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  height: 0.1.h,
                                  color: ColorManager.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              child: Text(
                                '${model.products == null ? 0 : model.products!.length} ${AppStrings.products.tr(context)}',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  height: 0.1.h,
                                  color: ColorManager.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                  SizedBox(
                    height: 0.1.h,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      Align(
        alignment: AlignmentDirectional.topStart,
        child: CircleAvatar(
          radius: 28,
          backgroundColor: ColorManager.primary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${DateTime.parse(model.orderDate).day}',
                style: TextStyle(
                  fontSize: 15.sp,
                  height: 1.1,
                  color: ColorManager.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${DateTime.parse(model.orderDate).month}/${DateTime.parse(model.orderDate).year}',
                style: TextStyle(
                  fontSize: 10.sp,
                  height: 1,
                  color: ColorManager.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
