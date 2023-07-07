import 'package:china_omda/models/banner_model.dart';
import 'package:china_omda/presentation/presentation_managers/exports.dart';

class BannerItem extends StatelessWidget {
  final BannerModel bannerModel;
  final Function()? onTap;

  const BannerItem({
    super.key,
    required this.bannerModel,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          bannerModel.startDate ?? '',
          style: TextStyle(
            fontSize: 11.sp,
          ),
        ),
        Text(
          bannerModel.endDate ?? '',
          style: TextStyle(
            fontSize: 11.sp,
          ),
        ),
        SizedBox(width: 1.w),
        Text(
          bannerModel.status! ? AppStrings.active.tr(context) : AppStrings.inActive.tr(context),
          style: TextStyle(
            fontSize: 11.sp,
            color: bannerModel.status! ? ColorManager.primaryGreen : ColorManager.red,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 13.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: ColorManager.primaryGreen,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Icon(
              Icons.remove_red_eye_outlined,
              color: ColorManager.white,
              size: 35,
            ),
          ),
        ),
      ],
    );
  }
}
