import 'package:flutter/material.dart';

class LightTheme {
  final _lightColor = _LightColor();
  late ThemeData theme;

  LightTheme() {
    theme = ThemeData(
        appBarTheme: const AppBarTheme(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)))),
        scaffoldBackgroundColor: Colors.white.withOpacity(0.7),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Colors.green),
        buttonTheme: ButtonThemeData(
            colorScheme: ColorScheme.light(onPrimary: Colors.purple, onSecondary: _lightColor.blueMenia)),
        colorScheme: const ColorScheme.light(),
        checkboxTheme: const CheckboxThemeData(
            side: BorderSide(color: Colors.green), fillColor: MaterialStatePropertyAll(Colors.green)),
        textTheme:
            ThemeData.light().textTheme.copyWith(titleMedium: TextStyle(fontSize: 25, color: _lightColor._textColor)));
  }
}

// Copywith demek

class _LightColor {
  final Color _textColor = const Color.fromARGB(255, 37, 5, 5);
  final Color blueMenia = const Color.fromARGB(95, 188, 248, 1);
}
