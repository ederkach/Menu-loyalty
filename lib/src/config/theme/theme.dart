import 'package:flutter/material.dart';

ThemeData customTheme() {
  return ThemeData(
    primaryColor: const Color(0xFF4C434A),
    backgroundColor: const Color(0xFFffffff),
    disabledColor: const Color(0xFFF4F5F7),
    fontFamily: 'DMSans',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0xFF71B24D)),
      ),
    ),
    textTheme: const TextTheme(
      button: TextStyle(color: Color(0xFFffffff)),
    ),
  );
}
