import 'package:china_omda/app/app_lang_cach.dart';
import 'package:china_omda/models/china_time.dart';
import 'package:china_omda/presentation/presentation_managers/exports.dart';
import 'package:http/http.dart' as http;
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  var firestore = FirebaseFirestore.instance;

  Future<void> getSavedLanguage() async {
    final String cachedLanguageCode = await LanguageCacheHelper().getCachedLanguageCode();
    emit(ChangeLocaleState(Locale(cachedLanguageCode)));
  }

  Future<void> changeLanguage() async {
    final String cachedLanguageCode = await LanguageCacheHelper().getCachedLanguageCode();
    Locale newLocale;
    if (cachedLanguageCode == 'ar') {
      newLocale = const Locale('en', '');
    } else {
      newLocale = const Locale('ar', '');
    }
    await LanguageCacheHelper().cacheLanguageCode(newLocale.languageCode);
    emit(ChangeLocaleState(newLocale));
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

  // Stream<String> getChinaTimeStream() {
  //   final controller = StreamController<String>();

  //   Timer.periodic(const Duration(seconds: 1), (timer) async {
  //     final response = await http.get(Uri.parse(
  //         'http://api.timezonedb.com/v2.1/get-time-zone?key=92X2UKAJP27C&format=json&by=zone&zone=Asia/Shanghai'));
  //     if (response.statusCode == 200) {
  //       final decodedData = json.decode(response.body);
  //       final dateTime = DateTime.parse(decodedData['datetime']);

  //       final formattedTime = Jiffy.parse(dateTime.toString())
  //           .format(pattern: 'a h:mm:ss'); // Format the time using Jiffy
  //       controller.add(formattedTime);
  //     }
  //   });

  //   return controller.stream;
  // }
}
