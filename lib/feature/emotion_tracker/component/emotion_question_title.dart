import 'package:emotion_tracker/core/src_core.dart';
import 'package:emotion_tracker/feature/src_feature.dart';
import 'package:flutter/material.dart';

class EmotionTitleBuilder extends StatelessWidget {
  const EmotionTitleBuilder(
    this.quizDetail, {
    super.key,
  });

  final QuizsDetail quizDetail;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextBuild(
          title: quizDetail.questionName ?? "",
          isBoldText: true,
          fontSize: AppDimens.sizeTextLarge,
        ),
        TextBuild(
          title: quizDetail.questionDescription ?? "",
          fontSize: AppDimens.sizeTextMedium,
        ),
      ],
    );
  }
}
