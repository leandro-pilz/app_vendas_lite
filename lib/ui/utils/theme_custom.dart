import 'package:flutter/material.dart';

import 'constants.dart';

final themeCustom = ThemeData(
  appBarTheme: AppBarTheme(
    elevation: kSmallElevation,
    iconTheme: const IconThemeData(color: Colors.white),
    color: Colors.green.shade500,
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: kVeryLargeFontSize,
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.green,
    foregroundColor: Colors.white,
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
  useMaterial3: true,
  cardTheme: CardTheme(
    elevation: kSmallElevation,
    color: Colors.white,
    surfaceTintColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(kBorderRadiusDefault),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    hintStyle: const TextStyle(color: Colors.black45),
    contentPadding: const EdgeInsets.symmetric(
      vertical: kVerySmallPadding,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(kBorderRadiusDefault),
      borderSide: const BorderSide(
        color: Colors.white,
        width: 0.0,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(kBorderRadiusDefault),
      borderSide: const BorderSide(
        color: Colors.white,
        width: 0.0,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(kBorderRadiusDefault),
      borderSide: const BorderSide(
        color: Colors.white,
        width: 0.0,
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(kBorderRadiusDefault),
      borderSide: const BorderSide(
        color: Colors.white,
        width: 0.0,
      ),
    ),
  ),
);
