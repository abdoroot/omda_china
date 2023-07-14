import 'package:china_omda/presentation/presentation_managers/exports.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);
        return Column(
          children: [
            HeaderView(
              headerText: AppStrings.welcome,
              headerTextColor: ColorManager.white,
              isLogin: false,
              anotherWidget: Row(
                children: [
                  SvgPicture.asset(ImageAssets.message),
                  SizedBox(width: 1.w),
                  Text(
                    '12',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: SizedBox(
                        height: 24.h,
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/weather.png',
                                  ),
                                  const Spacer(),
                                  const Text(
                                    'الطقس الان في الصين',
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 8.0.h),
                                    child: Image.asset(
                                      'assets/images/time.png',
                                    ),
                                  ),
                                  const Spacer(),
                                  const Text(
                                    'الوقت الان في الصين',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'العطلة القادمة بالصين بعد',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '128',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 26.sp,
                          ),
                        ),
                        SizedBox(width: 1.w),
                        Text(
                          'يوم',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'مهرجان قوراب التنين',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                      ),
                    ),
                    Text(
                      'لمدة  ثلاث ايام ويكون بالعادة من منتصف شهر يونيو',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    SizedBox(
                      width: double.infinity,
                      height: 18.h,
                      child: StreamBuilder<List<BannerModel>>(
                          stream: cubit.getAllActiveBanners(),
                          builder: (context, snapshot) {
                            if (snapshot.data == null) {
                              return const SizedBox();
                            }
                            return Image(
                              image: NetworkImage(snapshot.data!.first.image!),
                              fit: BoxFit.cover,
                            );
                          }),
                    ),
                    SizedBox(height: 2.h),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
