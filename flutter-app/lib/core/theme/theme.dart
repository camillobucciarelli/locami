import 'package:flutter/material.dart';

import 'color_schemes.dart';

part 'spacing.dart';

ElevatedButtonThemeData _elevatedButtonThemeData =
ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    minimumSize: const Size.square(kMinInteractiveDimension),
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
  ),
);

final lightTheme = ThemeData.light(useMaterial3: true).copyWith(
  colorScheme: lightColorScheme,
  elevatedButtonTheme: _elevatedButtonThemeData,
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(),
  ),
);

final darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
  colorScheme: darkColorScheme,
  elevatedButtonTheme: _elevatedButtonThemeData,
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(),
  ),
);
