import 'package:china_omda/presentation/presentation_managers/exports.dart';

class ProductItem extends StatelessWidget {

  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(vertical: 2.5.h),
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
                    blurRadius:5,
                  ),
                ],
                // boxShadow:
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset('assets/images/image 21.png',
                      width: 32.w, fit: BoxFit.cover),
                  Column(
                    children: [
                      Text(
                        AppStrings.referenceNumber.tr(context),
                        style: TextStyle(
                            fontSize: 13.sp,
                            color: ColorManager.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        '202316123456',
                        style: TextStyle(
                            fontSize: 15.sp,
                            height: 0.1.h,
                            color: ColorManager.red,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding:
                            EdgeInsets.symmetric(horizontal: 5.w),
                            child: Text(
                              '3 ${AppStrings.images.tr(context)}',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  height: 0.1.h,
                                  color: ColorManager.black,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding:
                            EdgeInsets.symmetric(horizontal: 5.w),
                            child: Text(
                              '12 ${AppStrings.products.tr(context)}',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  height: 0.1.h,
                                  color: ColorManager.black,
                                  fontWeight: FontWeight.w700),
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
                      '17',
                      style: TextStyle(
                          fontSize: 15.sp,
                          height: 0.1.h,
                          color: ColorManager.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '05/2023',
                      style: TextStyle(
                          fontSize: 10.sp,
                          height: 0.1.h,
                          color: ColorManager.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
          ),
        ]);
  }
}
