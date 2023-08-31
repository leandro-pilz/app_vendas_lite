import 'package:flutter/material.dart';

import 'constants.dart';

final themeCustom = ThemeData(
  appBarTheme: AppBarTheme(
    color: Colors.green.shade500,
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: kVeryLargeFontSize,
    ),
  ),
  scaffoldBackgroundColor: Colors.grey.shade50,
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
);
