import 'package:china_omda/presentation/presentation_managers/exports.dart';

class EventsView extends StatelessWidget {
  const EventsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {},
      builder: (context, state) {
        var lang = AppStrings.lang.tr(context);
        AdminCubit cubit = AdminCubit.get(context);
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
                            StreamBuilder<List<EventModel>>(
                              stream: cubit.getAllActiveEvent(),
                              builder: (context, snapshot) {
                                return Text(
                                  "${AppStrings.active.tr(context)} : ${snapshot.data == null ? 0 : snapshot.data!.length}",
                                  style: TextStyle(
                                    color: ColorManager.primaryGreen,
                                    height: 0.5,
                                  ),
                                );
                              },
                            ),
                            StreamBuilder<List<EventModel>>(
                              stream: cubit.getAllInActiveEvent(),
                              builder: (context, snapshot) {
                                return Text(
                                  "${AppStrings.inActive.tr(context)} : ${snapshot.data == null ? 0 : snapshot.data!.length}",
                                  style: TextStyle(
                                    color: ColorManager.red,
                                    height: 0.5,
                                  ),
                                );
                              },
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
                        StreamBuilder<List<EventModel>>(
                            stream: cubit.getAllEvent(),
                            builder: (context, snapshot) {
                              if (snapshot.data == null) {
                                return const SizedBox();
                              }
                              return ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                itemBuilder: (context, index) => EventItem(
                                  eventModel: snapshot.data![index],
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ModifyEvents(model: snapshot.data![index])),
                                    );
                                  },
                                ),
                                separatorBuilder: (context, index) => Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 2.0.w),
                                  child: const Divider(thickness: 1),
                                ),
                                itemCount: snapshot.data!.length,
                              );
                            }),
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
