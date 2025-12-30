import 'package:flutter/material.dart';
import 'package:spark_hire_app/theme/skeleton_theme.dart';

ThemeData lightMode = ThemeData(
  useMaterial3: true,
  appBarTheme: const AppBarTheme(scrolledUnderElevation: 0.0),
  dividerColor: const Color(0xFF818898),
  colorScheme: ColorScheme.light(
    primary: const Color(0xFF301DA4),
    onPrimary: Colors.white,
    secondary: const Color(0xFFA6FF00),
    onSurface: Colors.black,
    inverseSurface: const Color(0xFFF5F5F5),
    onError: const Color(0xFFE13138),
  ),
  extensions: [
    SkeletonTheme(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade200,
    ),
  ],
);
