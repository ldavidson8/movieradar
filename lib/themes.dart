import 'package:flutter/material.dart';
import 'theme_constants.dart';

abstract class AppThemes {
  static ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors.colorPrimary,
        primaryColorDark: AppColors.colorPrimaryDark,
        primaryColorLight: AppColors.colorPrimaryLight,
        colorScheme:
            const ColorScheme.light(background: AppColors.lightBackground),
        scaffoldBackgroundColor: AppColors.lightBackground,
        cardTheme: CardTheme(
          color: AppColors.lightBackground,
          surfaceTintColor: AppColors.lightBackground,
        ),
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
            borderSide: BorderSide(color: AppColors.lightInputBorderColour),
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.trueBlack,
          unselectedItemColor: AppColors.lightMuted,
          selectedItemColor: AppColors.colorPrimary,
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: AppColors.lightBody,
          unselectedLabelColor: AppColors.lightMuted,
          indicatorColor: AppColors.lightBody,
          splashFactory: NoSplash.splashFactory,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.lightBody,
            foregroundColor: AppColors.lightBackground,
          ),
        ),
      );

  static ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors.darkPrimary,
        primaryColorDark: AppColors.darkPrimaryDark,
        primaryColorLight: AppColors.darkPrimaryLight,
        colorScheme:
            const ColorScheme.dark(background: AppColors.darkBackground),
        scaffoldBackgroundColor: AppColors.darkBackground,
        cardColor: AppColors.darkBackground,
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
        tabBarTheme: const TabBarTheme(
          labelColor: AppColors.darkBody,
          unselectedLabelColor: AppColors.darkMuted,
          indicatorColor: AppColors.darkBody,
          splashFactory: NoSplash.splashFactory,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.darkBody,
              foregroundColor: AppColors.darkBackground,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
        ),
      );

  static ThemeData get blackTheme => ThemeData(
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

  static ThemeData get purpleTheme => ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors.darkPrimary,
        primaryColorDark: AppColors.darkPrimaryDark,
        primaryColorLight: AppColors.darkPrimaryLight,
        colorScheme:
            const ColorScheme.dark(background: AppColors.darkPurpleBackground),
        scaffoldBackgroundColor: AppColors.darkPurpleBackground,
      );

  static ThemeData get blueTheme => ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors.darkPrimary,
        primaryColorDark: AppColors.darkPrimaryDark,
        primaryColorLight: AppColors.darkPrimaryLight,
        colorScheme:
            const ColorScheme.dark(background: AppColors.darkBlueBackground),
        scaffoldBackgroundColor: AppColors.darkBlueBackground,
      );
}
