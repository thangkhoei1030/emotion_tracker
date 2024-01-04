import 'package:emotion_tracker/core/src_core.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:emotion_tracker/feature/src_feature.dart';
import 'package:get/get.dart';

class EmotionTrackerPage extends BaseGetWidget<EmotionTrackerController> {
  const EmotionTrackerPage({super.key});

  @override
  EmotionTrackerController get controller =>
      Get.put(EmotionTrackerControllerImp());

  Color get pageColor =>
      HexColor.fromHex(controller.quizResponse
          .quizsDetail[controller.currentQuestionIndex.value].questionColor) ??
      EmotionTrackerUtils.mainColor(
          controller.colorRandom[controller.currentQuestionIndex.value]);

  @override
  Widget buildWidgets(BuildContext context) {
    return UtilWidget.buildErrorOccurred(
      controller,
      isShowAppBar: true,
      isHaveData: () => controller.quizResponse != QuizResponse(),
      onReload: controller.onReloadErrorOccured,
      child: PageScaffold(
        showAppBar: false,
        backgroundColorAppBar: Colors.transparent,
        child: Obx(
          () => controller.isShowLoading.value
              ? const LoadingAnimationLottie(
                  animationDialogType: AnimationDialogType.quizLoading,
                  description:
                      "Đang lấy danh sách câu hỏi\n Vui lòng chờ một chút nha",
                )
              : Obx(
                  () => EmotionTrackerItemBuilder(
                    controller.currentQuestionIndex.value,
                  ),
                ),
        ),
      ),
    );
  }
}
