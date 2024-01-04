import 'package:emotion_tracker/core/src_core.dart';
import 'package:emotion_tracker/feature/src_feature.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildAction extends GetView<QuizOverviewController> {
  const BuildAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: BaseButton(
          backgroundColor: HexColor.fromHex("4b68e4"),
          colorText: Colors.white,
          function: () {
            controller.onDoneQuiz();
          },
          titleButton: QuizOverviewSting.doneQuiz,
        )),
        UtilWidget.sizedBoxWidthPadding,
        Expanded(
            child: BaseButton(
          backgroundColor: HexColor.fromHex("3e4b8f"),
          colorText: Colors.white,
          function: () {
            Get.back();
          },
          titleButton: QuizOverviewSting.continueQuiz,
        )),
      ],
    );
  }
}
