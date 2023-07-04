import 'package:china_omda/app/app_lang_cach.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

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
}
