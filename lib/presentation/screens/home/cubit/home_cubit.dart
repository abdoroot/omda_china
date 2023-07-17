import 'package:china_omda/app/app_lang_cach.dart';
import 'package:china_omda/presentation/presentation_managers/exports.dart';
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
