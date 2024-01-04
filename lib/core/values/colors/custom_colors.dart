import 'package:flutter/material.dart';
 
class CustomColor extends ThemeExtension<CustomColor> {
  final Color? color1;
  final Color? color2;
  final Color? color3;

  const CustomColor({
    required this.color1,
    required this.color2,
    required this.color3,
  });

  @override
  CustomColor copyWith({
    Color? color1,
    Color? color2,
    Color? color3,
  }) {
    return CustomColor(
      color1: color1 ?? this.color1,
      color2: color2 ?? this.color2,
      color3: color3 ?? this.color3,
    );
  }

  @override
  CustomColor lerp(CustomColor? other, double t) {
    if (other is! CustomColor) {
      return this;
    }
    return CustomColor(
      color1: Color.lerp(color1, other.color1, t),
      color2: Color.lerp(color2, other.color2, t),
      color3: Color.lerp(color3, other.color3, t),
    );
  }
}
