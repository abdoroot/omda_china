import 'package:china_omda/presentation/presentation_managers/exports.dart';
import 'package:china_omda/presentation/screens/china_public_holidays/views/china_public_holidays_view.dart';
import 'package:china_omda/presentation/screens/events/views/events_view.dart';
import 'package:china_omda/presentation/screens/home/views/home_view.dart';

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
        .snapshots()
        .map((event) => event.docs.map((e) => EventModel.fromJson(e.data())).toList());
  }

  Stream<List<EventModel>> getAllActiveHoliday() {
    return firestore
        .collection('holidays')
        .where('status', isEqualTo: true)
        .snapshots()
        .map((event) => event.docs.map((e) => EventModel.fromJson(e.data())).toList());
  }
}
