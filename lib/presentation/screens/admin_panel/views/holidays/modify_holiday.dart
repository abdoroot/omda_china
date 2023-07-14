import 'package:china_omda/presentation/presentation_managers/exports.dart';

class ModifyHolidays extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final EventModel model;
  ModifyHolidays({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {},
      builder: (context, state) {
        var lang = AppStrings.lang.tr(context);
        AdminCubit cubit = AdminCubit.get(context);
        cubit.modifyHolidayDetailsAr.text = model.detailsAr ?? '';
        cubit.modifyHolidayDetailsEn.text = model.detailsEn ?? '';
        cubit.modifyHolidayTitleAr.text = model.titleAr ?? '';
        cubit.modifyHolidayTitleEn.text = model.titleEn ?? '';
        cubit.modifyHolidayStatus = model.status;
        cubit.modifyHolidayStartDate.text = model.startDate ?? '';
        return Scaffold(
          drawerEnableOpenDragGesture: lang == 'English' ? false : true,
          endDrawerEnableOpenDragGesture: lang == 'English' ? true : false,
          backgroundColor: ColorManager.white,
          body: Column(
            children: [
              const HeaderView(
                headerText: AppStrings.addHoliday,
                isLogin: false,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          SizedBox(height: 2.h),
                          OmdaTextFormFiled(
                              enabled: true,
                              lableText: AppStrings.startDate,
                              controller: cubit.modifyHolidayStartDate,
                              prefixIcon: IconButton(
                                onPressed: () async {
                                  DateTime? selectedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2100),
                                  );
                                  cubit.modifyHolidayStartDate.text =
                                      Jiffy.parse('$selectedDate').format(pattern: 'dd/MM/yyyy');
                                },
                                icon: Icon(
                                  Icons.calendar_month,
                                  color: ColorManager.black,
                                  size: 22.sp,
                                ),
                              )),
                          SizedBox(height: 3.h),
                          OmdaTextFormFiled(
                            enabled: true,
                            lableText: AppStrings.titleAr,
                            controller: cubit.modifyHolidayTitleAr,
                          ),
                          SizedBox(height: 3.h),
                          OmdaTextFormFiled(
                            enabled: true,
                            lableText: AppStrings.titleEn,
                            controller: cubit.modifyHolidayTitleEn,
                          ),
                          SizedBox(height: 3.h),
                          OmdaTextArea(
                            enabled: true,
                            lableText: AppStrings.detailsAr,
                            controller: cubit.modifyHolidayDetailsAr,
                          ),
                          SizedBox(height: 3.h),
                          OmdaTextArea(
                            enabled: true,
                            lableText: AppStrings.detailsEn,
                            controller: cubit.modifyHolidayDetailsEn,
                          ),
                          SizedBox(height: 3.h),
                          GlobalDropDownButton(
                            items: cubit.statusValues,
                            onChanged: (value) {
                              if (value == AppStrings.active) {
                                cubit.changeModifyHolidayStatus(true);
                              } else {
                                cubit.changeModifyHolidayStatus(false);
                              }
                            },
                            padding: EdgeInsets.zero,
                            height: 7.h,
                            lableText: AppStrings.status.tr(context),
                            value: cubit.modifyHolidayStatus!
                                ? AppStrings.active
                                : AppStrings.inActive,
                          ),
                          SizedBox(height: 3.h),
                          GlobalButton(
                            text: 'save',
                            color: ColorManager.secondary,
                            height: 5.h,
                            width: 25.w,
                            colorText: ColorManager.white,
                            raduis: 10,
                            onPressed: () {
                              if (formKey.currentState!.validate() &&
                                  cubit.modifyHolidayDetailsAr.text.isNotEmpty &&
                                  cubit.modifyHolidayDetailsEn.text.isNotEmpty &&
                                  cubit.modifyHolidayStatus != null) {
                                cubit
                                    .modifyHoliday(
                                  detailsAr: cubit.modifyHolidayDetailsAr.text,
                                  detailsEn: cubit.modifyHolidayDetailsEn.text,
                                  startDate: cubit.modifyHolidayStartDate.text,
                                  status: cubit.modifyHolidayStatus!,
                                  titleAr: cubit.modifyHolidayTitleAr.text,
                                  titleEn: cubit.modifyHolidayTitleEn.text,
                                  eventId: model.id ?? '',
                                )
                                    .then((value) {
                                  cubit.clearHolidayController();
                                  Navigator.pop(context);
                                });
                              }
                            },
                          ),
                          SizedBox(height: 3.h),
                        ],
                      ),
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
