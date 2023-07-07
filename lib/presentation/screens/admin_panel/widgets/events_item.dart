import 'package:china_omda/presentation/presentation_managers/exports.dart';

class EventItem extends StatelessWidget {
  final EventModel eventModel;
  final Function()? onTap;

  const EventItem({
    super.key,
    required this.eventModel,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var lang = AppStrings.lang.tr(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          eventModel.startDate ?? '',
          style: TextStyle(
            fontSize: 11.sp,
          ),
        ),
        SizedBox(
          width: 19.w,
          child: Text(
            lang != 'English' ? eventModel.titleEn ?? '' : eventModel.titleAr ?? '',
            style: TextStyle(
              fontSize: 11.sp,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(width: 1.w),
        SizedBox(
          width: 19.w,
          child: Text(
            lang != 'English' ? eventModel.detailsEn! : eventModel.detailsAr!,
            style: TextStyle(
              fontSize: 11.sp,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(width: 1.w),
        Text(
          eventModel.status! ? AppStrings.active.tr(context) : AppStrings.inActive.tr(context),
          style: TextStyle(
            fontSize: 11.sp,
            color: eventModel.status! ? ColorManager.primaryGreen : ColorManager.red,
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
