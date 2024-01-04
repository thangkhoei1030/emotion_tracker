import 'package:emotion_tracker/core/src_core.dart';
import 'package:emotion_tracker/feature/src_feature.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:get/get.dart';

class CongratulationsPage extends BaseGetWidget<CongratulationController> {
  const CongratulationsPage({super.key});

  @override
  CongratulationController get controller =>
      Get.put(CongratulationControllerImp());

  @override
  Widget buildWidgets(BuildContext context) {
    return PageScaffold(
      showAppBar: false,
      backgroundColor: context.primaryColor,
      child: CardBuilder(
        linearGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.lightBlue.withOpacity(0.5),
              Colors.lightBlue,
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: const [
                TextBuild(
                  title: EmotionTrackerString.done,
                  fontSize: AppDimens.sizeTextVeryLarge,
                  textColor: Colors.white,
                  isBoldText: true,
                ),
                UtilWidget.sizedBoxPadding,
                TextBuild(
                  title: EmotionTrackerString.thank,
                  textColor: Colors.white,
                )
              ],
            ),
            UtilWidget.buildErrorOccurred(
              controller,
              isPage: false,
              isHaveData: () =>
                  controller.emotionCompleteResponse.value != null,
              onReload: controller.onReloadErrorOccured,
              child: Obx(
                () => controller.isShowLoading.value
                    ? const ShowLoadingCalculate()
                    : const EmotionCompleteInfo(),
              ),
            ),
            UtilWidget.sizedBoxPaddingHuge,
            BaseButton(
                backgroundColor: Colors.white,
                function: () {
                  Get.back();
                },
                titleButton: 'Thoát')
          ],
        ),
      ),
    );
  }
}

class ShowLoadingCalculate extends StatelessWidget {
  const ShowLoadingCalculate({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        AnimationDialog(
          animationDialogType: AnimationDialogType.calculate,
        ),
        UtilWidget.sizedBoxPaddingHuge,
        TextBuild(
          title: "Chúng tôi đang tính toán kết quả\nVui lòng đợi xíu nha",
          textColor: Colors.white,
        )
      ],
    );
  }
}

class EmotionCompleteInfo extends GetView<CongratulationController> {
  const EmotionCompleteInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimationDialog(
          animationDialogType:
              controller.percentOfPositive >= controller.percentOfNegative
                  ? AnimationDialogType.happy
                  : AnimationDialogType.sad,
        ),
        UtilWidget.sizedBoxPaddingHuge,
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const TextBuild(title: "Tích cực"),
                TextBuild(
                    title:
                        "${(controller.percentOfPositive * 10).floor()}  / 10")
              ],
            ),
            UtilWidget.sizedBoxPadding,
            BuildSliderPercent(
                percent: controller.percentOfPositive,
                mainColor: Colors.yellow.shade300)
          ],
        ),
        UtilWidget.sizedBoxPadding,
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const TextBuild(title: "Tiêu cực"),
                TextBuild(
                    title:
                        "${(controller.percentOfNegative * 10).floor()}  / 10")
              ],
            ),
            UtilWidget.sizedBoxPadding,
            BuildSliderPercent(
                percent: controller.percentOfNegative, mainColor: Colors.red)
          ],
        ),
      ],
    );
  }
}
