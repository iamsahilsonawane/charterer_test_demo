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
      ),
    ),
    AppTheme.darkTheme: ThemeData(
      scaffoldBackgroundColor: Colors.black,
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
      ),
    )
  };

  static const textTheme = TextTheme(
    headlineMedium: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
    ),
  );
}
