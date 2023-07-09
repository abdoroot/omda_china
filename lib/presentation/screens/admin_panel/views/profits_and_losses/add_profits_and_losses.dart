import 'package:china_omda/presentation/presentation_managers/exports.dart';

class AddProfitsAndLosses extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AddProfitsAndLosses({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {},
      builder: (context, state) {
        AdminCubit cubit = AdminCubit.get(context);
        var lang = AppStrings.lang.tr(context);
        TextEditingController dateCont = TextEditingController();
        dateCont.text = cubit.addProfitsDate == null
            ? ''
            : Jiffy.parse(cubit.addProfitsDate.toString()).format(pattern: 'dd/MM/yyyy');
        return Scaffold(
          drawerEnableOpenDragGesture: lang == 'English' ? false : true,
          endDrawerEnableOpenDragGesture: lang == 'English' ? true : false,
          backgroundColor: ColorManager.white,
          body: Column(
            children: [
              HeaderView(
                headerText: AppStrings.addLosses,
                isLogin: false,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          SizedBox(height: 2.h),
                          OmdaTextFormFiled(
                            enabled: true,
                            lableText: AppStrings.date,
                            controller: dateCont,
                            prefixIcon: IconButton(
                              onPressed: () async {
                                DateTime? selectedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                );
                                cubit.seleteDateLosses(selectedDate);
                                //     Jiffy.parse('$selectedDate').format(pattern: 'dd/MM/yyyy');
                                print(selectedDate);
                              },
                              icon: Icon(
                                Icons.calendar_month,
                                color: ColorManager.black,
                                size: 22.sp,
                              ),
                            ),
                          ),
                          SizedBox(height: 4.h),
                          OmdaTextFormFiled(
                            enabled: true,
                            lableText: AppStrings.amount,
                            controller: cubit.addProfitsAmount,
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(height: 4.h),
                          OmdaTextFormFiled(
                            enabled: true,
                            lableText: AppStrings.reason,
                            controller: cubit.addProfitsReason,
                            keyboardType: TextInputType.text,
                          ),
                          SizedBox(height: 4.h),
                          GlobalButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                cubit
                                    .addLosses(
                                  lossesDate: cubit.addProfitsDate!,
                                  reason: cubit.addProfitsReason.text,
                                  type: 'losses',
                                  amount: cubit.addProfitsAmount.text,
                                )
                                    .then((value) {
                                  cubit.clearAddLossesController();
                                  Navigator.pop(context);
                                });
                              }
                            },
                            text: 'اضافة',
                            color: ColorManager.secondary,
                            height: 6.h,
                            width: 30.w,
                            colorText: ColorManager.white,
                          ),
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
