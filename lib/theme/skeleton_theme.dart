import 'package:flutter/material.dart';

@immutable
class SkeletonTheme extends ThemeExtension<SkeletonTheme> {
  final Color baseColor;
  final Color highlightColor;

  const SkeletonTheme({
    required this.baseColor,
    required this.highlightColor,
  });

  @override
  SkeletonTheme copyWith({
    Color? baseColor,
    Color? highlightColor,
    BorderRadius? borderRadius,
  }) {
    return SkeletonTheme(
      baseColor: baseColor ?? this.baseColor,
      highlightColor: highlightColor ?? this.highlightColor,
    );
  }

  @override
  SkeletonTheme lerp(ThemeExtension<SkeletonTheme>? other, double t) {
    if (other is! SkeletonTheme) return this;
    return SkeletonTheme(
      baseColor: Color.lerp(baseColor, other.baseColor, t)!,
      highlightColor: Color.lerp(highlightColor, other.highlightColor, t)!,
    );
  }
}
