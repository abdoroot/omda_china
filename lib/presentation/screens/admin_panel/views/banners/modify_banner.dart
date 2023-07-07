import 'package:china_omda/models/banner_model.dart';
import 'package:china_omda/presentation/presentation_managers/exports.dart';
import 'package:jiffy/jiffy.dart';

class ModifyBanner extends StatelessWidget {
  final BannerModel model;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ModifyBanner({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {},
      builder: (context, state) {
        AdminCubit cubit = AdminCubit.get(context);
        cubit.modifyBannerEndDate.text = model.endDate ?? '';
        cubit.modifyBannerStartDate.text = model.startDate ?? '';
        cubit.modifyBannerStatus = model.status;
        var lang = AppStrings.lang.tr(context);
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
                            controller: cubit.modifyBannerStartDate,
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
                            controller: cubit.modifyBannerEndDate,
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
                            child: cubit.modifyBannerImage == null
                                ? model.image == null
                                    ? const SizedBox()
                                    : Image.network(
                                        model.image!,
                                        fit: BoxFit.fill,
                                      )
                                : Image(
                                    image: FileImage(cubit.modifyBannerImage!),
                                    fit: BoxFit.fill,
                                  ),
                          ),
                          SizedBox(height: 3.h),
                          GlobalButton(
                            text: 'إضغط هنا لإضافة واحد آخر بدل هذا',
                            color: ColorManager.secondary,
                            height: 5.h,
                            width: 55.w,
                            colorText: ColorManager.white,
                            raduis: 10,
                            onPressed: () {
                              cubit.modifyBannersImage();
                            },
                          ),
                          SizedBox(height: 3.h),
                          GlobalDropDownButton(
                            items: cubit.statusValues,
                            onChanged: (value) {
                              if (value == AppStrings.active) {
                                cubit.selecteModfidyBannerStatus(true);
                              } else {
                                cubit.selecteModfidyBannerStatus(false);
                              }
                            },
                            padding: EdgeInsets.zero,
                            height: 7.h,
                            lableText: AppStrings.status.tr(context),
                            value:
                                cubit.modifyBannerStatus! ? AppStrings.active : AppStrings.inActive,
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
                                  cubit.modifyBannerStatus != null) {
                                cubit
                                    .modifyBanner(
                                        startDate: cubit.modifyBannerStartDate.text,
                                        endDate: cubit.modifyBannerEndDate.text,
                                        status: cubit.modifyBannerStatus ?? true,
                                        image: cubit.modifyBannerImage,
                                        bannerId: model.id!)
                                    .then((value) {
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
