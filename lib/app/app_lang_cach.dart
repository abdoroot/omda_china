import 'package:china_omda/data/local/chach_helper.dart';

class LanguageCacheHelper {
  Future<void> cacheLanguageCode(String languageCode) async {
    CachHelper.saveData(key: "LOCALE", value: languageCode);
  }

  Future<String> getCachedLanguageCode() async {
    final cachedLanguageCode = CachHelper.getData(key: "LOCALE");
    if (cachedLanguageCode != null) {
      return cachedLanguageCode;
    } else {
      return "en";
    }
  }

  static bool isAr = CachHelper.getData(key: "LOCALE") == 'ar';
}
