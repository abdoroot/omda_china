import 'package:china_omda/presentation/presentation_managers/exports.dart';
import 'package:jiffy/jiffy.dart';

class AddBanner extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AddBanner({super.key});

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
                headerText: AppStrings.addBanner,
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
                            controller: cubit.bannerStartDate,
                            prefixIcon: IconButton(
                              onPressed: () async {
                                DateTime? selectedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                );
                                cubit.bannerStartDate.text =
                                    Jiffy.parse('$selectedDate').format(pattern: 'dd/MM/yyyy');
                                print(selectedDate);
                              },
                              icon: Icon(
                                Icons.calendar_month,
                                color: ColorManager.black,
                                size: 22.sp,
                              ),
                            ),
                          ),
                          SizedBox(height: 3.h),
                          OmdaTextFormFiled(
                            enabled: true,
                            lableText: AppStrings.endDate,
                            controller: cubit.bannerEndDate,
                            prefixIcon: IconButton(
                              onPressed: () async {
                                DateTime? selectedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                );
                                cubit.bannerEndDate.text =
                                    Jiffy.parse('$selectedDate').format(pattern: 'dd/MM/yyyy');
                                print(selectedDate);
                              },
                              icon: Icon(
                                Icons.calendar_month,
                                color: ColorManager.black,
                                size: 22.sp,
                              ),
                            ),
                          ),
                          SizedBox(height: 3.h),
                          SizedBox(
                            width: double.infinity,
                            height: 15.h,
                            child: cubit.bannerImage == null
                                ? const SizedBox()
                                : Image(
                                    image: FileImage(cubit.bannerImage!),
                                    fit: BoxFit.fill,
                                  ),
                          ),
                          SizedBox(height: 3.h),
                          GlobalButton(
                            text: 'اضافة بنر جديد',
                            color: ColorManager.secondary,
                            height: 5.h,
                            width: 55.w,
                            colorText: ColorManager.white,
                            raduis: 10,
                            onPressed: () {
                              cubit.addBannerImage();
                            },
                          ),
                          SizedBox(height: 3.h),
                          GlobalDropDownButton(
                            items: cubit.statusValues,
                            onChanged: (value) {
                              if (value == AppStrings.active) {
                                cubit.selecteBannerStatus(true);
                              } else {
                                cubit.selecteBannerStatus(false);
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
                                  cubit.bannerImage != null &&
                                  cubit.bannerStatus != null) {
                                cubit
                                    .addBanner(
                                  startDate: cubit.bannerStartDate.text,
                                  endDate: cubit.bannerEndDate.text,
                                  status: cubit.bannerStatus ?? true,
                                  image: cubit.bannerImage!,
                                )
                                    .then((value) {
                                  cubit.clearBannerController();
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
