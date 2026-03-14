import 'package:flutter/material.dart';
import 'package:spark_hire_app/theme/skeleton_theme.dart';

ThemeData darkMode = ThemeData(
  useMaterial3: true,
  appBarTheme: const AppBarTheme(scrolledUnderElevation: 0.0),
  dividerColor: const Color(0xFF818898),
  colorScheme: ColorScheme.dark(
    primary: const Color(0xFFB06FEF),
    onPrimary: Colors.white,
    secondary: const Color(0xFFA6FF00),
    onSurface: Colors.white,
    inverseSurface: const Color(0xFF333333),
    onError: const Color(0xFFE13138),
    outline: const Color(0xFFA4ACB9),
    surface: const Color(0xFF0D0D12),
    tertiary: Colors.grey[400],
  ),
  extensions: [
    SkeletonTheme(
      baseColor: Colors.grey.shade800,
      highlightColor: Colors.grey.shade700,
    ),
  ],
);
