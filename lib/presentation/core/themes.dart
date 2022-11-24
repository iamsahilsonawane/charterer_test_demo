import 'package:flutter/material.dart';

import 'colors.dart';

enum AppTheme {
  lightTheme,
  darkTheme,
}

class AppThemes {
  static final appThemeData = {
    AppTheme.lightTheme: ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primarySwatch: Colors.blue,
      switchTheme: SwitchThemeData(
        trackColor: MaterialStateProperty.all(AppColors.primaryColor),
        thumbColor: MaterialStateProperty.all(Colors.white),
      ),
      inputDecorationTheme: const InputDecorationTheme(
          filled: true, fillColor: Color(0xFFE9EEF0)),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey,
      ),
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          shadowColor: AppColors.primaryColor.withOpacity(.25),
          elevation: 15,
          padding: const EdgeInsets.all(20.0),
        ),
      ),
      textTheme: TextTheme(
        headlineMedium: textTheme.headlineMedium!.copyWith(color: Colors.black),
        titleSmall: textTheme.titleSmall!.copyWith(color: Colors.black),
        bodyMedium: textTheme.bodyMedium!.copyWith(color: Colors.black),
        bodySmall: textTheme.bodySmall!.copyWith(color: Colors.black),
      ),
    ),
    AppTheme.darkTheme: ThemeData(
      scaffoldBackgroundColor: Colors.black,
      inputDecorationTheme: const InputDecorationTheme(
          filled: true, fillColor: Color(0xFF232323)),
      primarySwatch: Colors.teal,
      switchTheme: SwitchThemeData(
        trackColor: MaterialStateProperty.all(AppColors.primaryColor),
        thumbColor: MaterialStateProperty.all(Colors.white),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey,
      ),
      backgroundColor: Colors.black,
      brightness: Brightness.dark,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          shadowColor: AppColors.primaryColor.withOpacity(.25),
          elevation: 15,
          padding: const EdgeInsets.all(20.0),
        ),
      ),
      textTheme: TextTheme(
        headlineMedium: textTheme.headlineMedium!.copyWith(color: Colors.white),
        titleSmall: textTheme.titleSmall!.copyWith(color: Colors.white),
        bodyMedium: textTheme.bodyMedium!.copyWith(color: Colors.white),
        bodySmall: textTheme.bodySmall!.copyWith(color: Colors.white),
      ),
    )
  };

  static const textTheme = TextTheme(
    headlineMedium: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w700,
    ),
    titleSmall: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  );
}
