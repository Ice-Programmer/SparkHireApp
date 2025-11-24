import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  useMaterial3: true,
  appBarTheme: const AppBarTheme(scrolledUnderElevation: 0.0),
  dividerColor: const Color(0xFF818898),
  colorScheme: ColorScheme.dark(
    primary: const Color(0xFFC791F9),
    onPrimary: Colors.white,
    secondary: const Color(0xFFA6FF00),
    onSurface: Colors.white,
    inverseSurface: const Color(0xFF333333),
  ),
);
