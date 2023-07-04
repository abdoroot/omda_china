// import 'package:flutter/material.dart';

// ThemeData getApplicationTheme() {
//   return ThemeData(
//     primaryColor: ColorManager.primary,
//     primaryColorLight: ColorManager.primary,
//     primaryColorDark: ColorManager.darkPrimary,
//     disabledColor: ColorManager.grey1,
//     splashColor: ColorManager.primary,
//     fontFamily: 'Almarai',
//     // cardview theme
//     cardTheme: CardTheme(
//       color: ColorManager.white,
//       shadowColor: ColorManager.grey,
//       elevation: AppSize.s4,
//     ),
//     // app bar theme
//     appBarTheme: AppBarTheme(
//       color: ColorManager.white,
//       elevation: 0,
//       titleTextStyle: getRegularStyle(fontSize: FontSize.s16, color: ColorManager.white),
//     ),

//     // button theme
//     buttonTheme: ButtonThemeData(
//         shape: const StadiumBorder(),
//         disabledColor: ColorManager.grey1,
//         buttonColor: ColorManager.primary,
//         splashColor: ColorManager.lightPrimary),

//     // elevated button theme
//     elevatedButtonTheme: ElevatedButtonThemeData(
//       style: ElevatedButton.styleFrom(
//         textStyle: getRegularStyle(
//           color: ColorManager.white,
//           fontSize: FontSize.s17,
//         ),
//         backgroundColor: ColorManager.primary,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(AppSize.s12),
//         ),
//       ),
//     ),

//     // text theme
//     textTheme: TextTheme(
//       displayLarge: getSemiBoldStyle(
//         color: ColorManager.darkGrey,
//         fontSize: FontSize.s16,
//       ),
//       headlineLarge: getSemiBoldStyle(color: ColorManager.darkGrey, fontSize: FontSize.s16),
//       headlineMedium: getRegularStyle(color: ColorManager.darkGrey, fontSize: FontSize.s14),
//       titleMedium: getMediumStyle(color: ColorManager.primary, fontSize: FontSize.s16),
//       titleSmall: getRegularStyle(color: ColorManager.white, fontSize: FontSize.s16),
//       bodyLarge: getRegularStyle(color: ColorManager.grey1),
//       bodySmall: getRegularStyle(color: ColorManager.grey),
//       bodyMedium: getRegularStyle(color: ColorManager.grey2, fontSize: FontSize.s12),
//       labelSmall: getBoldStyle(color: ColorManager.primary, fontSize: FontSize.s14),
//     ),

//     progressIndicatorTheme: ProgressIndicatorThemeData(
//       color: ColorManager.primary,
//     ),

//     //input decoration theme (text form field)
//     inputDecorationTheme: InputDecorationTheme(
//       // content padding
//       contentPadding: const EdgeInsets.all(AppPadding.p18),
//       // hint style
//       hintStyle: getRegularStyle(color: ColorManager.lightGrey, fontSize: FontSize.s17),
//       labelStyle: getMediumStyle(color: ColorManager.lightGrey, fontSize: FontSize.s17),
//       errorStyle: getRegularStyle(color: ColorManager.error),

//       // enabled border style
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(15.r),
//         borderSide: BorderSide(color: ColorManager.white),
//       ),
//       // focused border style
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(15.r),
//         borderSide: const BorderSide(
//           color: Colors.blue,
//         ),
//       ),

//       // error border style
//       errorBorder: OutlineInputBorder(
//         borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
//         borderRadius: BorderRadius.all(
//           Radius.circular(15.r),
//         ),
//       ),
//       // focused border style
//       focusedErrorBorder: OutlineInputBorder(
//         borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
//         borderRadius: BorderRadius.all(
//           Radius.circular(15.r),
//         ),
//       ),
//     ),
//   );
// }
