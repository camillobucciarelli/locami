import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_schemes.dart';

part 'spacing.dart';

part 'text_theme.dart';

ElevatedButtonThemeData _elevatedButtonThemeData = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    minimumSize: const Size.square(kMinInteractiveDimension),
  ),
);

InputDecorationTheme _inputDecorationTheme = const InputDecorationTheme(
  border: OutlineInputBorder(),
);

final lightTheme = ThemeData.light(useMaterial3: true).copyWith(
  colorScheme: lightColorScheme,
  textTheme: _textTheme(ThemeData.light(useMaterial3: true).textTheme),
  elevatedButtonTheme: _elevatedButtonThemeData,
  inputDecorationTheme: _inputDecorationTheme,
);

final darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
  colorScheme: darkColorScheme,
  textTheme: _textTheme(ThemeData.dark(useMaterial3: true).textTheme),
  elevatedButtonTheme: _elevatedButtonThemeData,
  inputDecorationTheme: _inputDecorationTheme,
);
