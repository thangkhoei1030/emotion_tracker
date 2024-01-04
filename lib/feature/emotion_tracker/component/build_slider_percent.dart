import 'package:emotion_tracker/core/utils/src_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildSliderPercent extends StatelessWidget {
  const BuildSliderPercent(
      {super.key,
      required this.percent,
      this.thumbColor,
      required this.mainColor,
      this.height,
      this.width});

  final double percent;

  final Color? thumbColor;

  final Color mainColor;

  final double? height;

  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10,
      child: Stack(
        children: [
          Container(
            height: 10,
            decoration: BoxDecoration(
                color: thumbColor ?? mainColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(AppDimens.radius20)),
            width: width ?? Get.width * 2 / 3,
          ),
          Container(
            height: 10,
            decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(AppDimens.radius20)),
            width: (width ?? Get.width * 2 / 3) * percent,
          ),
        ],
      ),
    );
  }
}
