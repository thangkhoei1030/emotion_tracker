import 'package:animate_do/animate_do.dart';
import 'package:emotion_tracker/core/src_core.dart';
import 'package:emotion_tracker/feature/src_feature.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmotionTrackerItemBuilder extends GetView<EmotionTrackerController> {
  const EmotionTrackerItemBuilder(this.index, {super.key});

  final int index;

  String get titleButton => controller.isFirstQuestion
      ? EmotionTrackerString.start
      : controller.isLastQuestion
          ? EmotionTrackerString.done
          : EmotionTrackerString.next;

  Color get pageColor =>
      HexColor.fromHex(
          controller.quizResponse.quizsDetail[index].questionColor) ??
      EmotionTrackerUtils.mainColor(controller.colorRandom[index]);

  @override
  Widget build(BuildContext context) {
    final questionDetail = controller.quizResponse.quizsDetail[index];

    return Container(
      color: pageColor,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FadeInRight(
                    duration: const Duration(milliseconds: 200),
                    child: BuildAppBarEmotionTracker(
                      currentIndex: index,
                    ),
                  ),
                  UtilWidget.sizedBoxPaddingHuge,
                  FadeInRight(
                      duration: const Duration(milliseconds: 200),
                      child: EmotionTitleBuilder(questionDetail)),
                  UtilWidget.sizedBoxPaddingHuge,
                  FadeInRight(
                    duration: const Duration(milliseconds: 200),
                    child: NetworkImageWidget(
                      heightImage: 300,
                      widthImage: 300,
                      urlImage: questionDetail.questionIcon.toUrlCDN(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          UtilWidget.sizedBoxPadding,
          Obx(() {
            return FadeInRight(
              duration: const Duration(milliseconds: 200),
              child: Column(
                children: [
                  TextBuild(
                    title: EmotionTrackerString
                        .listLevel[controller.currentEmotion.value.round()],
                  ),
                  SizedBox(
                    width: Get.width * 3 / 4,
                    child: EmotionTrackerUtils.themeSlider(
                      context,
                      HSLColor.fromColor(pageColor)
                          .withLightness(0.4)
                          .toColor(),
                      () => Slider(
                        value: controller.currentEmotion.value,
                        max: 4,
                        overlayColor: MaterialStateProperty.all(Colors.grey),
                        divisions: 4,
                        onChanged: (value) => controller.emotionChange(value),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
          UtilWidget.sizedBoxPaddingHuge,
          UtilWidget.sizedBoxPaddingHuge,
          BaseButton(
            function: () => controller.nextQuestionOrSumary(index),
            colorText: Colors.white,
            backgroundColor:
                HSLColor.fromColor(pageColor).withLightness(0.4).toColor(),
            titleButton: titleButton,
          ),
        ],
      ).paddingSymmetric(
        horizontal: AppDimens.defaultPadding,
        vertical: AppDimens.paddingHuge,
      ),
    );
  }
}
