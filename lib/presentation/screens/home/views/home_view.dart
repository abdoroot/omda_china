import 'package:china_omda/models/china_time.dart';
import 'package:china_omda/presentation/presentation_managers/exports.dart';
import 'package:http/http.dart' as http;

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Timer timer;
  late ChinaTime chinaTime;

  @override
  void initState() {
    super.initState();
    chinaTime = ChinaTime();
    fetchChinaTimeData();
    timer = Timer.periodic(const Duration(seconds: 60), (timer) {
      fetchChinaTimeData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomNavBarCubit, BottomNavBarState>(
      listener: (context, state) {},
      builder: (context, state) {
        BottomNavBarCubit cubit = BottomNavBarCubit.get(context);
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
                                  Text(
                                    AppStrings.weatherChina.tr(context),
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 8.h),
                                    child: Text(
                                      chinaTime.dateTime == null
                                          ? ''
                                          : Jiffy.parse(chinaTime.dateTime!)
                                              .format(pattern: 'h:mm a'),
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                        color: ColorManager.black,
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    AppStrings.timeChina.tr(context),
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                    ),
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
                      AppStrings.nextHolidayChina.tr(context),
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ' ${cubit.remainingDays}',
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

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void fetchChinaTimeData() async {
    final response = await http.get(Uri.parse(
        'https://api.ipgeolocation.io/timezone?apiKey=4127f9d52170457c90aff375ea6c158a&tz=Asia/Shanghai'));

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body);
      setState(() {
        chinaTime = ChinaTime.fromJson(decodedData);
      });
    } else {
      setState(() {
        print(response.body);
      });
    }
  }
}
