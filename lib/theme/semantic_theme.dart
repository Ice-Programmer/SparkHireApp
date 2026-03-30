import 'package:flutter/material.dart';

@immutable
class SemanticTheme extends ThemeExtension<SemanticTheme> {
  final Color success;

  const SemanticTheme({required this.success});

  @override
  SemanticTheme copyWith({Color? success, Color? onSuccess}) {
    return SemanticTheme(success: success ?? this.success);
  }

  @override
  SemanticTheme lerp(ThemeExtension<SemanticTheme>? other, double t) {
    if (other is! SemanticTheme) return this;
    return SemanticTheme(success: Color.lerp(success, other.success, t)!);
  }
}

extension Semantic on ThemeData {
  SemanticTheme get semantic => extension<SemanticTheme>()!;
}