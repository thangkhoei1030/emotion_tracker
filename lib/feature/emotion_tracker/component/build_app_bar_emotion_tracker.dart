import 'package:emotion_tracker/core/src_core.dart';
import 'package:emotion_tracker/feature/src_feature.dart';
import 'package:emotion_tracker/pages/src_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildAppBarEmotionTracker extends GetView<EmotionTrackerController> {
  const BuildAppBarEmotionTracker({super.key, required this.currentIndex});
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CardBuilder(
          radiusModel: const RadiusModel(radiusAll: AppDimens.radiusDefault),
          onTap: () {
            Get.toNamed(AppRoutes.quizOverview);
          },
          elevation: 8,
          paddingModel: const PaddingModel(paddingAll: AppDimens.paddingSmall),
          backgroundColor: HexColor.fromHex(
              controller.quizResponse.quizsDetail[currentIndex].questionColor),
          child: const Icon(
            Icons.category,
            color: Colors.white,
          ),
        ),
        TextBuild(
          title: '${currentIndex + 1}/${controller.totalQuestion}',
          textColor: Colors.white,
        ),
      ],
    );
  }
}
