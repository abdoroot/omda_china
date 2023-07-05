import 'package:china_omda/models/events_model.dart';
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
        Text(
          lang != 'English' ? eventModel.titleEn ?? '' : eventModel.titleAr ?? '',
          style: TextStyle(
            fontSize: 11.sp,
          ),
        ),
        Text(
          lang != 'English' ? eventModel.detailsEn ?? '' : eventModel.detailsAr ?? '',
          style: TextStyle(
            fontSize: 11.sp,
          ),
        ),
        Text(
          lang != 'English' ? eventModel.status.toString() : eventModel.titleAr.toString(),
          style: TextStyle(
            fontSize: 11.sp,
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
