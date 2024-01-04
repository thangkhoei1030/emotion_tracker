import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmotionTrackerUtils {
  static Color mainColor(Color color) =>
      HSLColor.fromColor(color).withLightness(0.8).toColor();

  static SliderTheme themeSlider(
          BuildContext context, Color color, WidgetCallback child) =>
      SliderTheme(
        data: SliderTheme.of(context).copyWith(
          activeTrackColor: color,
          thumbColor: color,
          inactiveTrackColor: Colors.white.withOpacity(0.2),
          trackShape: const RectangularSliderTrackShape(),
          trackHeight: 12,
          thumbShape: const RoundSliderThumbShape(
            enabledThumbRadius: 12.0,
          ),
          overlayColor: mainColor(color),
          valueIndicatorColor: color,
          valueIndicatorTextStyle:
              Get.textTheme.bodySmall!.copyWith(color: Colors.white),
        ),
        child: child(),
      );
}
