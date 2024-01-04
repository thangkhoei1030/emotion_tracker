import 'package:emotion_tracker/core/src_core.dart';
import 'package:emotion_tracker/feature/src_feature.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildTitle extends GetView<QuizOverviewController> {
  const BuildTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
              child: TextBuild(
            textAlign: TextAlign.start,
            title: QuizOverviewSting.doYouWantContinue,
            style: Get.textTheme.bodySmall!.copyWith(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textColor: Colors.white,
          )),
          Container(
            alignment: Alignment.centerRight,
            child: TextBuild(
              title:
                  "${controller.emotionTrackerController.currentQuestionIndex.value} / ${controller.emotionTrackerController.totalQuestion}",
              textColor: Colors.white,
              fontSize: AppDimens.sizeTextLarge,
            ),
          ),
        ],
      ),
    );
  }
}
