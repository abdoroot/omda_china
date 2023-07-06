import 'package:china_omda/models/events_model.dart';
import 'package:china_omda/presentation/presentation_managers/exports.dart';

class EventCard extends StatelessWidget {
  final EventModel model;

  const EventCard({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    var lang = AppStrings.lang.tr(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SizedBox(
        width: double.infinity,
        height: 20.h,
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                lang == 'English' ? model.titleAr ?? '' : model.titleEn ?? '',
                style: TextStyle(
                  fontSize: 18.sp,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 1.h),
              Text(
                '${AppStrings.eventStartDate.tr(context)} : ${model.startDate}',
                style: TextStyle(
                  fontSize: 14.sp,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 1.h),
              Text(
                lang == 'English' ? model.detailsAr ?? '' : model.detailsEn ?? '',
                style: TextStyle(
                  fontSize: 12.sp,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
