import 'package:flutter/material.dart';
import 'theme_constants.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    brightness: Brightness.light,
    primaryColor: AppColors.colorPrimary,
    primaryColorDark: AppColors.colorPrimaryDark,
    primaryColorLight: AppColors.colorPrimaryLight,
    colorScheme: const ColorScheme.light(background: AppColors.lightBackground),
    scaffoldBackgroundColor: AppColors.lightBackground,
    textTheme: const TextTheme().apply(
      fontFamily: BaseTheme.bodyBase.fontFamily,
      bodyColor: AppColors.lightBody,
      displayColor: AppColors.lightBody,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightBackground,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.lightInputBorderBolour),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.trueBlack,
      unselectedItemColor: AppColors.lightMuted,
      selectedItemColor: AppColors.colorPrimary,
    ),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    primaryColor: AppColors.darkPrimary,
    primaryColorDark: AppColors.darkPrimaryDark,
    primaryColorLight: AppColors.darkPrimaryLight,
    colorScheme: const ColorScheme.dark(background: AppColors.darkBackground),
    scaffoldBackgroundColor: AppColors.darkBackground,
    textTheme: const TextTheme().apply(
      fontFamily: BaseTheme.bodyBase.fontFamily,
      bodyColor: AppColors.darkBody,
      displayColor: AppColors.darkBody,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkBackground,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.darkInputBorderColour),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.trueBlack,
      unselectedItemColor: AppColors.darkMuted,
      selectedItemColor: AppColors.colorPrimary,
    ),
  );

  static final ThemeData amoledTheme = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    primaryColor: AppColors.darkPrimary,
    primaryColorDark: AppColors.darkPrimaryDark,
    primaryColorLight: AppColors.darkPrimaryLight,
    colorScheme: const ColorScheme.dark(background: AppColors.trueBlack),
    scaffoldBackgroundColor: AppColors.darkBackground,
    textTheme: const TextTheme().apply(
      fontFamily: BaseTheme.bodyBase.fontFamily,
      bodyColor: AppColors.darkBody,
      displayColor: AppColors.darkBody,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkBackground,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.darkInputBorderColour),
      ),
    ),
  );
}
