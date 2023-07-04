import 'package:china_omda/app/app_lang.dart';
import 'package:china_omda/presentation/global_widget/header_view.dart';
import 'package:china_omda/presentation/presentation_managers/color_manager.dart';
import 'package:china_omda/presentation/presentation_managers/string_manager.dart';
import 'package:china_omda/presentation/screens/events/views/widgets/event_card.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class EventsView extends StatelessWidget {
  const EventsView({super.key});

  @override
  Widget build(BuildContext context) {
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
