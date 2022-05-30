import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData customTheme() {
  return ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFffffff),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF4C434A),
      onPrimary: const Color(0xFFffffff),
      secondary: const Color(0xFF71B24D),
      onSecondary: const Color(0xFF0D1C2E),
      secondaryContainer: const Color(0xFFF4F5F7),
    ).copyWith(
        primary: const Color(0xFF4C434A),
        onPrimaryContainer: const Color(0xFFffffff),
        background: const Color(0xFFffffff),
        secondary: const Color(0xFF71B24D)),
    fontFamily: 'DMSans',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: const Color(0xFF71B24D),
        onPrimary: const Color(0xFFffffff),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFffffff),
      iconTheme: IconThemeData(color: Color(0xFF0D1C2E)),
      actionsIconTheme: IconThemeData(color: Color(0xFF0D1C2E)),
      centerTitle: false,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Color(0xFFffffff),
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFFF4F5F7),
      counterStyle: const TextStyle(color: Color(0xFF0D1C2E)),
      labelStyle: const TextStyle(color: Color(0xFF0D1C2E)),
      border: MaterialStateOutlineInputBorder.resolveWith((states) {
        final isFocused = states.contains(MaterialState.focused);
        final isDisabled = states.contains(MaterialState.disabled);
        final hasError = states.contains(MaterialState.error);

        final color = isDisabled
            ? const Color(0xFFF4F5F7)
            : hasError
                ? Colors.red
                : const Color(0xFFF4F5F7);
        final width = isFocused ? 2.0 : 1.0;

        return OutlineInputBorder(
            borderSide: BorderSide(color: color, width: width));
      }),
    ),
    iconTheme: const IconThemeData(
      color: Color(0xFF808080),
    ),
    textTheme: Typography()
        .black
        .apply(
          displayColor: const Color(0xFF1D1D1D),
          bodyColor: const Color(0xFF1D1D1D),
        )
        .copyWith(
          displayLarge: const TextStyle(
            color: Color(0xFF1D1D1D),
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.8,
          ),
          bodyMedium: const TextStyle(
            color: Color(0xFF1D1D1D),
            fontSize: 17.0,
          ),
          titleMedium: TextStyle(
            color: const Color(0xFF1D1D1D).withOpacity(0.5),
            fontSize: 17.0,
          ),
        ),
  );
}
