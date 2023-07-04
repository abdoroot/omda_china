// import 'package:china_omda/data/local/chach_helper.dart';
// import 'package:flutter/material.dart';

// class Language {
//   static Future<Locale> getLocale() async {
//     String languageCode = CachHelper.getData(key: 'language_code') ?? 'en';
//     String countryCode = CachHelper.getData(key: 'country_code') ?? 'US';
//     return Locale(languageCode, countryCode);
//   }

//   static Future<void> setLocale(Locale locale) async {
//     await CachHelper.saveData(key: 'language_code', value: locale.languageCode);
//     await CachHelper.saveData(key: 'country_code', value: locale.countryCode);
//   }
// }
