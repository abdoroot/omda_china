import 'package:china_omda/models/events_model.dart';
import 'package:china_omda/presentation/presentation_managers/exports.dart';
import 'package:china_omda/presentation/screens/events/views/widgets/event_card.dart';

class EventsView extends StatelessWidget {
  const EventsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomNavBarCubit, BottomNavBarState>(
      listener: (context, state) {},
      builder: (context, state) {
        BottomNavBarCubit cubit = BottomNavBarCubit.get(context);
        return Column(
          children: [
            const HeaderView(
              headerText: AppStrings.eventInChina,
              anotherWidget: SizedBox(),
              isLogin: false,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.eventScreenTitle.tr(context),
                      style: TextStyle(
                        color: ColorManager.red,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 1.h),
                    StreamBuilder<List<EventModel>>(
                      stream: cubit.getAllActiveEvent(),
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
