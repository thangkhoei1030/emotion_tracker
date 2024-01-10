import 'package:emotion_tracker/core/src_core.dart';
import 'package:emotion_tracker/feature/src_feature.dart';
import 'package:emotion_tracker/pages/routes.dart';
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
            colors: AppColors.mainBackGroundColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UtilWidget.sizedBoxHeightSafeAreaTop(context),
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
            UtilWidget.sizedBoxPaddingHuge,
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
              width: Get.width / 2,
              backgroundColor: Colors.white,
              function: () {
                Get.until((route) => Get.currentRoute == AppRoutes.homePage);
              },
              titleButton: 'Thoát',
            ),
            UtilWidget.sizedBoxHeightSafeAreaBottom(context),
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
                const TextBuild(
                  title: "Tích cực",
                  textColor: Colors.white,
                ),
                TextBuild(
                    textColor: Colors.white,
                    title:
                        "${(controller.percentOfPositive * 10).floor()}  / 10")
              ],
            ),
            UtilWidget.sizedBoxPadding,
            BuildSliderPercent(
              percent: controller.percentOfPositive,
              mainColor: HexColor.fromHex("F1CC53")!,
              thumbColor: HexColor.fromHex("FFF1C2"),
            )
          ],
        ),
        UtilWidget.sizedBoxPadding,
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const TextBuild(
                  title: "Tiêu cực",
                  textColor: Colors.white,
                ),
                TextBuild(
                  textColor: Colors.white,
                  title: "${(controller.percentOfNegative * 10).floor()}  / 10",
                )
              ],
            ),
            UtilWidget.sizedBoxPadding,
            BuildSliderPercent(
              thumbColor: HexColor.fromHex("FFD4DB"),
              percent: controller.percentOfNegative,
              mainColor: HexColor.fromHex("FB7185")!,
            )
          ],
        ),
      ],
    );
  }
}
