import 'package:china_omda/presentation/presentation_managers/exports.dart';

class AddHolidays extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AddHolidays({super.key});

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
                              controller: cubit.holidayStartDate,
                              prefixIcon: IconButton(
                                onPressed: () async {
                                  DateTime? selectedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2100),
                                  );
                                  cubit.holidayStartDate.text =
                                      Jiffy.parse('$selectedDate').format(pattern: 'dd/MM/yyyy');
                                  print(selectedDate);
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
                            controller: cubit.holidayTitleAr,
                          ),
                          SizedBox(height: 3.h),
                          OmdaTextFormFiled(
                            enabled: true,
                            lableText: AppStrings.titleEn,
                            controller: cubit.holidayTitleEn,
                          ),
                          SizedBox(height: 3.h),
                          OmdaTextArea(
                            enabled: true,
                            lableText: AppStrings.detailsAr,
                            controller: cubit.holidayDetailsAr,
                          ),
                          SizedBox(height: 3.h),
                          OmdaTextArea(
                            enabled: true,
                            lableText: AppStrings.detailsEn,
                            controller: cubit.holidayDetailsEn,
                          ),
                          SizedBox(height: 3.h),
                          GlobalDropDownButton(
                            items: cubit.statusValues,
                            onChanged: (value) {
                              if (value == AppStrings.active) {
                                cubit.selecteHolidayStatus(true);
                              } else {
                                cubit.selecteHolidayStatus(false);
                              }
                            },
                            padding: EdgeInsets.zero,
                            height: 7.h,
                            lableText: AppStrings.status.tr(context),
                            value: null,
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
                                  cubit.holidayDetailsAr.text.isNotEmpty &&
                                  cubit.holidayDetailsEn.text.isNotEmpty &&
                                  cubit.holidayStatus != null) {
                                cubit
                                    .addHoliday(
                                  detailsAr: cubit.holidayDetailsAr.text,
                                  detailsEn: cubit.holidayDetailsEn.text,
                                  startDate: cubit.holidayStartDate.text,
                                  status: cubit.holidayStatus ?? true,
                                  titleAr: cubit.holidayTitleAr.text,
                                  titleEn: cubit.holidayTitleEn.text,
                                )
                                    .then((value) {
                                  cubit.clearEventController();
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
