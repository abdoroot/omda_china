import 'package:china_omda/presentation/presentation_managers/exports.dart';

class ModifyEvents extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final EventModel model;
  ModifyEvents({
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
        cubit.modifyDetailsAr.text = model.detailsAr ?? '';
        cubit.modifyDetailsEn.text = model.detailsEn ?? '';
        cubit.modifyTitleAr.text = model.titleAr ?? '';
        cubit.modifyTitleEn.text = model.titleEn ?? '';
        cubit.modifyEventStatus = model.status;
        cubit.modifyStartDate.text = model.startDate ?? '';
        return Scaffold(
          drawerEnableOpenDragGesture: lang == 'English' ? false : true,
          endDrawerEnableOpenDragGesture: lang == 'English' ? true : false,
          backgroundColor: ColorManager.white,
          body: Column(
            children: [
              const HeaderView(
                headerText: AppStrings.addEvent,
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
                              controller: cubit.modifyStartDate,
                              prefixIcon: IconButton(
                                onPressed: () async {
                                  DateTime? selectedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2100),
                                  );
                                  cubit.modifyStartDate.text =
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
                            controller: cubit.modifyTitleAr,
                          ),
                          SizedBox(height: 3.h),
                          OmdaTextFormFiled(
                            enabled: true,
                            lableText: AppStrings.titleEn,
                            controller: cubit.modifyTitleEn,
                          ),
                          SizedBox(height: 3.h),
                          OmdaTextArea(
                            enabled: true,
                            lableText: AppStrings.detailsAr,
                            controller: cubit.modifyDetailsAr,
                          ),
                          SizedBox(height: 3.h),
                          OmdaTextArea(
                            enabled: true,
                            lableText: AppStrings.detailsEn,
                            controller: cubit.modifyDetailsEn,
                          ),
                          SizedBox(height: 3.h),
                          GlobalDropDownButton(
                            items: cubit.statusValues,
                            onChanged: (value) {
                              if (value == AppStrings.active) {
                                cubit.changeModifyEventStatus(true);
                              } else {
                                cubit.changeModifyEventStatus(false);
                              }
                            },
                            padding: EdgeInsets.zero,
                            height: 7.h,
                            lableText: AppStrings.status.tr(context),
                            value:
                                cubit.modifyEventStatus! ? AppStrings.active : AppStrings.inActive,
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
                                  cubit.modifyDetailsAr.text.isNotEmpty &&
                                  cubit.modifyDetailsEn.text.isNotEmpty &&
                                  cubit.modifyEventStatus != null) {
                                cubit
                                    .modifyEvent(
                                  detailsAr: cubit.modifyDetailsAr.text,
                                  detailsEn: cubit.modifyDetailsEn.text,
                                  startDate: cubit.modifyStartDate.text,
                                  status: cubit.modifyEventStatus!,
                                  titleAr: cubit.modifyTitleAr.text,
                                  titleEn: cubit.modifyTitleEn.text,
                                  eventId: model.id ?? '',
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
