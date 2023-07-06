import 'package:china_omda/presentation/presentation_managers/exports.dart';
import 'package:china_omda/presentation/screens/events/views/widgets/event_card.dart';

class ChinaPublicHolidaysView extends StatelessWidget {
  const ChinaPublicHolidaysView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomNavBarCubit, BottomNavBarState>(
      listener: (context, state) {},
      builder: (context, state) {
        BottomNavBarCubit cubit = BottomNavBarCubit.get(context);
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
                    StreamBuilder<List<EventModel>>(
                      stream: cubit.getAllActiveHoliday(),
                      builder: (context, snapshot) {
                        if (snapshot.data == null) {
                          return const SizedBox.shrink();
                        }
                        return ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => EventCard(model: snapshot.data![index]),
                          separatorBuilder: (context, index) => SizedBox(height: 5.h),
                          itemCount: snapshot.data!.length,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
