import 'package:china_omda/models/events_model.dart';
import 'package:china_omda/presentation/presentation_managers/exports.dart';
import 'package:china_omda/presentation/screens/admin_panel/cubit/admin_cubit.dart';
import 'package:china_omda/presentation/screens/admin_panel/cubit/admin_state.dart';
import 'package:china_omda/presentation/screens/admin_panel/widgets/events_item.dart';

class EventsView extends StatelessWidget {
  const EventsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {},
      builder: (context, state) {
        var lang = AppStrings.lang.tr(context);
        return Scaffold(
          drawerEnableOpenDragGesture: lang == 'English' ? false : true,
          endDrawerEnableOpenDragGesture: lang == 'English' ? true : false,
          backgroundColor: ColorManager.white,
          body: Column(
            children: [
              const HeaderView(
                headerText: AppStrings.enteredEvents,
                isLogin: false,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Column(
                      children: [
                        Text(
                          AppStrings.numberOfEvents.tr(context),
                          style: TextStyle(
                            color: ColorManager.secondary,
                            height: 1,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              AppStrings.numberOfEvents.tr(context),
                              style: TextStyle(
                                color: ColorManager.primaryGreen,
                                height: 0.5,
                              ),
                            ),
                            Text(
                              AppStrings.numberOfEvents.tr(context),
                              style: TextStyle(
                                color: ColorManager.red,
                                height: 0.5,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.h),
                        DrawerDivider(
                          dividerText: AppStrings.eventInChina,
                          color: ColorManager.white,
                          colorText: ColorManager.primary,
                          fontSize: 12.sp,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppStrings.startDate.tr(context),
                              style: TextStyle(
                                fontSize: 11.sp,
                              ),
                            ),
                            Text(
                              AppStrings.title.tr(context),
                              style: TextStyle(
                                fontSize: 11.sp,
                              ),
                            ),
                            SizedBox(width: 1.w),
                            Text(
                              AppStrings.details.tr(context),
                              style: TextStyle(
                                fontSize: 11.sp,
                              ),
                            ),
                            Text(
                              AppStrings.status.tr(context),
                              style: TextStyle(
                                fontSize: 11.sp,
                              ),
                            ),
                            Text(
                              AppStrings.view.tr(context),
                              style: TextStyle(
                                fontSize: 11.sp,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.0.w),
                          child: const Divider(
                            thickness: 1,
                          ),
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) => EventItem(
                            eventModel: EventModel(
                              titleAr: 'العنوان عربي',
                              titleEn: 'english title',
                              status: true,
                              id: '123',
                              detailsAr: 'تفاصيل عربي',
                              detailsEn: 'english details',
                              startDate: '04/7/2023',
                            ),
                          ),
                          separatorBuilder: (context, index) => Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.0.w),
                            child: const Divider(
                              thickness: 1,
                            ),
                          ),
                          itemCount: 8,
                        ),
                        SizedBox(height: 2.h),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: GlobalButton(
                            text: 'اضافة فعالية',
                            color: ColorManager.secondary,
                            height: 6.h,
                            width: 30.w,
                            colorText: ColorManager.white,
                            onPressed: () {
                              Navigator.pushNamed(context, Routes.addEvent);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: const BottomWidget(isAdmin: true),
          drawer: const DrawerView(isLogin: false, isAdmin: true),
          endDrawer: const DrawerView(isLogin: false, isAdmin: true),
        );
      },
    );
  }
}
