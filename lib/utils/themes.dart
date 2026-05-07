import 'package:flutter/material.dart';

import '../app_theme/app_colors.dart';



ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.white,
  cardColor: Colors.black12,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFFE57EB0),
    brightness: Brightness.light,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
   scaffoldBackgroundColor: const Color(0xFF0B0B12),

  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFFF1B881),
    brightness: Brightness.dark,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF0B0B12),
    foregroundColor: Colors.white,
  ),
);

extension CustomColors on ColorScheme {
  Color get dottedContainerLight =>  Color(0xFF0B0B12);   // Light mode color
  Color get dottedContainerDark  => const Color(0xFFF5F5F5);
  //Color(0x20FFFFFF);   // Dark mode transparent white
}

