import 'package:china_omda/models/china_time.dart';
import 'package:china_omda/presentation/presentation_managers/exports.dart';
import 'package:china_omda/presentation/screens/china_public_holidays/views/china_public_holidays_view.dart';
import 'package:china_omda/presentation/screens/events/views/events_view.dart';
import 'package:china_omda/presentation/screens/home/views/home_view.dart';
import 'package:http/http.dart' as http;

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarInitial());

  static BottomNavBarCubit get(context) => BlocProvider.of(context);
  var firestore = FirebaseFirestore.instance;

  int screenIndex = 0;

  List<Widget> screens = [
    const HomeView(),
    const EventsView(),
    const ChinaPublicHolidaysView(),
  ];

  void changeScreenIndex(int val) {
    screenIndex = val;
    emit(ChangeScreenIndexState());
  }

  // Locale? newLocale;

  // void changeLanguage(BuildContext context) async {
  //   if (isEnglish == true) {
  //     newLocale = const Locale('en', 'US');
  //   } else {
  //     newLocale = const Locale('ar', 'SA');
  //   }
  //   EasyLocalization.of(context)!.setLocale(newLocale!);
  //   isEnglish = !isEnglish!;
  //   CachHelper.saveData(key: 'lang', value: isEnglish);
  //   emit(ChangeAppLangState());
  // }

  Stream<List<EventModel>> getAllActiveEvent() {
    return firestore
        .collection('events')
        .where('status', isEqualTo: true)
        .orderBy('startDate', descending: true)
        .snapshots()
        .map((event) => event.docs.map((e) => EventModel.fromJson(e.data())).toList());
  }

  Stream<List<EventModel>> getAllActiveHoliday() {
    return firestore
        .collection('holidays')
        .where('status', isEqualTo: true)
        .orderBy('startDate', descending: true)
        .snapshots()
        .map((event) => event.docs.map((e) => EventModel.fromJson(e.data())).toList());
  }

  Stream<List<BannerModel>> getAllActiveBanners() {
    return firestore
        .collection('banners')
        .where('status', isEqualTo: true)
        .snapshots()
        .map((event) => event.docs.map((e) => BannerModel.fromJson(e.data())).toList());
  }

  Stream<ChinaTime> getChinaTimeStream() {
    final controller = StreamController<ChinaTime>();

    Timer.periodic(const Duration(seconds: 1), (timer) async {
      final response = await http.get(Uri.parse(
          'https://api.ipgeolocation.io/timezone?apiKey=1831be03f797492db3c104da98266973&tz=Asia/Shanghai'));

      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body);
        final chinaTime = ChinaTime.fromJson(decodedData);
        controller.add(chinaTime);
      } else {
        controller.addError('Failed to fetch time data');
      }
    });

    return controller.stream;
  }

  EventModel? lastHoliday;
  int? remainingDays;

  Future<void> getLastHoliday() async {
    firestore.collection('holidays').where('status', isEqualTo: true).get().then((value) {
      List<EventModel> eventsList = [];
      for (var element in value.docs) {
        eventsList.add(EventModel.fromJson(element.data()));
      }
      lastHoliday = getNearestEvent(eventsList);
     // remainingDays = calculateRemainingDays(lastHoliday!.startDate!);
      emit(GetLastHolidaySuccess());
    }).catchError((e) {
      debugPrint(e.toString());
      emit(GetLastHolidayError());
    });
  }

  EventModel getNearestEvent(List<EventModel> events) {
    if (events.isEmpty) {
      throw Exception('لا توجد أحداث متاحة');
    }
    events.sort((a, b) => DateTime.parse(a.startDate!).compareTo(DateTime.parse(b.startDate!)));
    return events.first;
  }

// int calculateRemainingDays(String startDate) {
//   DateTime eventDate = DateTime.parse(startDate.replaceAll('/', '-'));
//   DateTime today = DateTime.now();
//   Duration difference = eventDate.difference(today);
//   return difference.inDays;
// }

  // EventModel? nearestHoliday;
  // int? remainingDays;

  // void getHoliday() {
  //   Stream<List<EventModel>> holidayStream = getAllActiveHoliday();

  //   holidayStream.listen((List<EventModel> holidays) {
  //      nearestHoliday = getNearestHoliday(holidays);
  //      remainingDays = calculateRemainingDays(nearestHoliday!.startDate!);

  //     // طباعة النتائج
  //     print('العطلة الأقرب: ${nearestHoliday.titleAr}');
  //     print('عدد الأيام المتبقية: $remainingDays');
  //   });
  // }

  // EventModel getNearestHoliday(List<EventModel> holidays) {
  //   if (holidays.isEmpty) {
  //     throw Exception('لا توجد عطلات متاحة');
  //   }

  //   holidays.sort((a, b) => a.startDate!.compareTo(b.startDate!));
  //   return holidays.first;
  // }

  // int calculateRemainingDays(String startDate) {
  //   DateTime holidayDate = DateTime.parse(startDate);
  //   DateTime today = DateTime.now();
  //   Duration difference = holidayDate.difference(today);
  //   return difference.inDays;
  // }
}
