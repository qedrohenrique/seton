import 'package:flutter/material.dart';

class CustomTheme extends ThemeExtension<CustomTheme> {
  final Color backgroundColor;
  final Color textColor;

  const CustomTheme({required this.backgroundColor, required this.textColor});

  @override
  ThemeExtension<CustomTheme> copyWith({
    Color? backgroundColor,
    Color? textColor,
  }) {
    return CustomTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
    );
  }

  @override
  ThemeExtension<CustomTheme> lerp(covariant CustomTheme? other, double t) {
    return CustomTheme(
      backgroundColor: Color.lerp(backgroundColor, other!.backgroundColor, t)!,
      textColor: Color.lerp(textColor, other.textColor, t)!,
    );
  }
}