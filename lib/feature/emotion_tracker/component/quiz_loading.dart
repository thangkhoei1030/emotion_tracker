import 'package:emotion_tracker/feature/src_feature.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

import 'package:emotion_tracker/core/src_core.dart';

class QuizLoading extends StatelessWidget {
  const QuizLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      color: HSLColor.fromColor(Colors.blue).withLightness(0.7).toColor(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          AnimationDialog(
            animationDialogType: AnimationDialogType.quizLoading,
            height: 300,
          ),
          UtilWidget.sizedBox10,
          TextBuild(
            title: "Đang lấy danh sách câu hỏi\n Vui lòng chờ một chút nha",
          ),
          UtilWidget.sizedBoxPaddingHuge,
          UtilWidget.sizedBoxPaddingHuge,
          UtilWidget.sizedBoxPaddingHuge,
          UtilWidget.sizedBoxPaddingHuge,
        ],
      ),
    );
  }
}
