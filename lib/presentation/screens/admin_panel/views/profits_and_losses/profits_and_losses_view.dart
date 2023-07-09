import 'package:china_omda/models/profits_and_losess_model.dart';
import 'package:china_omda/presentation/presentation_managers/exports.dart';
import 'package:china_omda/presentation/screens/admin_panel/widgets/profits_and_losses_item.dart';

class ProfitsAndLossesView extends StatelessWidget {
  const ProfitsAndLossesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {},
      builder: (context, state) {
        AdminCubit cubit = AdminCubit.get(context);
        var lang = AppStrings.lang.tr(context);
        var startDate = TextEditingController();
        var endDate = TextEditingController();
        startDate.text = cubit.profitsStartDate == null
            ? ''
            : Jiffy.parse(cubit.profitsStartDate.toString()).format(pattern: 'dd/MM/yyyy');
        endDate.text = cubit.profitsEndDate == null
            ? ''
            : Jiffy.parse(cubit.profitsEndDate.toString()).format(pattern: 'dd/MM/yyyy');
        return Scaffold(
          drawerEnableOpenDragGesture: lang == 'English' ? false : true,
          endDrawerEnableOpenDragGesture: lang == 'English' ? true : false,
          backgroundColor: ColorManager.white,
          body: Column(
            children: [
              const HeaderView(
                headerText: AppStrings.profitsAndLosses,
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
                          AppStrings.fieldReport.tr(context),
                          style: TextStyle(
                            color: ColorManager.secondary,
                            height: 1,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppStrings.from.tr(context),
                              style: TextStyle(
                                color: ColorManager.black,
                                height: 1,
                              ),
                            ),
                            OmdaTextFormFiled(
                              enabled: true,
                              height: 7.h,
                              width: 38.w,
                              controller: startDate,
                              prefixIcon: IconButton(
                                onPressed: () async {
                                  DateTime? selectedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2100),
                                  );
                                  cubit.seleteStartDateLosses(selectedDate);
                                },
                                icon: Icon(
                                  Icons.calendar_month,
                                  color: ColorManager.black,
                                  size: 22.sp,
                                ),
                              ),
                            ),
                            Text(
                              AppStrings.to.tr(context),
                              style: TextStyle(
                                color: ColorManager.black,
                                height: 1,
                              ),
                            ),
                            OmdaTextFormFiled(
                              enabled: true,
                              height: 7.h,
                              width: 38.w,
                              controller: endDate,
                              prefixIcon: IconButton(
                                onPressed: () async {
                                  DateTime? selectedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2100),
                                  );
                                  cubit.seleteEndDateLosses(selectedDate);
                                },
                                icon: Icon(
                                  Icons.calendar_month,
                                  color: ColorManager.black,
                                  size: 22.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '#',
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                            ),
                            Text(
                              AppStrings.date.tr(context),
                              style: TextStyle(
                                fontSize: 11.sp,
                              ),
                            ),
                            SizedBox(width: 1.w),
                            Text(
                              AppStrings.reason.tr(context),
                              style: TextStyle(
                                fontSize: 11.sp,
                              ),
                            ),
                            SizedBox(width: 1.w),
                            Text(
                              AppStrings.type.tr(context),
                              style: TextStyle(
                                fontSize: 11.sp,
                              ),
                            ),
                            Text(
                              AppStrings.amount.tr(context),
                              style: TextStyle(
                                fontSize: 11.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.h),
                        if (cubit.profitsStartDate == null || cubit.profitsEndDate == null)
                          StreamBuilder<List<ProfitsAndLossesModel>>(
                            stream: cubit.getAllProfitsAndLosses(),
                            builder: (context, snapshot) {
                              if (snapshot.data == null) {
                                return const SizedBox();
                              }
                              return ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                itemBuilder: (context, index) => ProfitsAndLossesItem(
                                  itemIndex: index,
                                  model: snapshot.data![index],
                                ),
                                separatorBuilder: (context, index) => Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 2.0.w),
                                  child: const Divider(thickness: 1),
                                ),
                                itemCount: snapshot.data!.length,
                              );
                            },
                          ),
                        StreamBuilder<List<ProfitsAndLossesModel>>(
                          stream: cubit.getProfitAndLossesRangDate(
                            cubit.profitsStartDate ?? DateTime.now(),
                            cubit.profitsEndDate ?? DateTime.now(),
                          ),
                          builder: (context, snapshot) {
                            if (snapshot.data == null) {
                              return const SizedBox();
                            }
                            return ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) => ProfitsAndLossesItem(
                                itemIndex: index,
                                model: snapshot.data![index],
                              ),
                              separatorBuilder: (context, index) => Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.0.w),
                                child: const Divider(thickness: 1),
                              ),
                              itemCount: snapshot.data!.length,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Column(
                  children: [
                    Divider(
                      color: ColorManager.primary,
                      thickness: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        StreamBuilder<int>(
                            stream: cubit.getProfitsSumStream(),
                            builder: (context, snapshot) {
                              return Text(
                                'مجموع الارباح ${snapshot.data}',
                                style: TextStyle(
                                  color: ColorManager.primaryGreen,
                                  fontSize: 10.sp,
                                ),
                              );
                            }),
                        StreamBuilder<int>(
                            stream: cubit.getLossesSumStream(),
                            builder: (context, snapshot) {
                              return Text(
                                'مجموع الخسائر ${snapshot.data}',
                                style: TextStyle(
                                  color: ColorManager.red,
                                  fontSize: 10.sp,
                                ),
                              );
                            }),
                        GlobalButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.addProfits);
                          },
                          text: 'إضافة خسائر',
                          color: ColorManager.secondary,
                          height: 5.h,
                          width: 25.w,
                          colorText: ColorManager.white,
                          raduis: 5,
                          fontSize: 13,
                        ),
                      ],
                    ),
                  ],
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
