import 'package:china_omda/presentation/presentation_managers/exports.dart';

class ConnectWithUsView extends StatelessWidget {
  final bool isLogin;
  const ConnectWithUsView({
    super.key,
    required this.isLogin,
  });

  @override
  Widget build(BuildContext context) {
    String lang = AppStrings.lang.tr(context);
    return Scaffold(
      drawerEnableOpenDragGesture: lang == 'English' ? false : true,
      endDrawerEnableOpenDragGesture: lang == 'English' ? true : false,
      body: Column(
        children: [
          HeaderView(
            headerText: AppStrings.connectUs,
            isLogin: isLogin,
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.connectWithUs.tr(context),
                    style: TextStyle(
                      color: ColorManager.text,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0.w),
                    child: Column(
                      children: [
                        const OmdaTextFormFiled(
                          lableText: AppStrings.name,
                          enabled: true,
                        ),
                        SizedBox(height: 2.h),
                        const OmdaTextFormFiled(
                          lableText: AppStrings.companyName,
                          enabled: true,
                        ),
                        SizedBox(height: 2.h),
                        const OmdaTextFormFiled(
                          lableText: AppStrings.email,
                          enabled: true,
                        ),
                        SizedBox(height: 2.h),
                        GlobalIntlTextFormField(
                          height: 8.h,
                          width: double.infinity,
                        ),
                        SizedBox(height: 2.h),
                        const OmdaTextArea(
                          enabled: true,
                          lableText: AppStrings.message,
                        ),
                        SizedBox(height: 2.h),
                        GlobalButton(
                          text: 'ارسال',
                          color: ColorManager.brown,
                          height: 6.h,
                          width: 50.w,
                          colorText: ColorManager.white,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: isLogin ? const SizedBox() : const BottomWidget(),
      drawer: isLogin ? null : const DrawerView(isLogin: false),
      endDrawer: isLogin ? null : const DrawerView(isLogin: false),
    );
  }
}
