import 'package:china_omda/presentation/presentation_managers/exports.dart';
import 'package:china_omda/presentation/screens/events/views/widgets/event_card.dart';

class ChinaPublicHolidaysView extends StatelessWidget {
  const ChinaPublicHolidaysView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderView(
          headerText: AppStrings.chinaHolidays,
          anotherWidget: SizedBox(),
          isLogin: false,
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    AppStrings.chinaHolidaysTitle.tr(context),
                    style: TextStyle(
                      color: ColorManager.red,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 1.h),
                const EventCard(),
                const EventCard(),
                const EventCard(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
