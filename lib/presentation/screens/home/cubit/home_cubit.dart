import 'package:china_omda/app/app_lang_cach.dart';
import 'package:china_omda/models/banner_model.dart';
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

  Stream<List<BannerModel>> getAllActiveBanners() {
    return firestore
        .collection('banners')
        .where('status', isEqualTo: true)
        .snapshots()
        .map((event) => event.docs.map((e) => BannerModel.fromJson(e.data())).toList());
  }
}
