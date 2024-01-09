import 'package:get/get.dart';
import 'package:emotion_tracker/core/src_core.dart';
import 'package:flutter/material.dart';
import 'package:emotion_tracker/feature/src_feature.dart';

class QuizOverviewPage extends BaseGetWidget<QuizOverviewController> {
  const QuizOverviewPage({super.key});

  @override
  Widget buildWidgets(BuildContext context) {
    return PageScaffold(
        showAppBar: false,
        child: CardBuilder(
          linearGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: AppColors.mainBackGroundColor,
          ),
          child: Column(
            children: const [
              BuildTitle(),
              UtilWidget.sizedBoxPadding,
              Expanded(
                child: BuildGridviewOverviewQuiz(),
              ),
              UtilWidget.sizedBoxPadding,
              BuildAction(),
            ],
          ).paddingSymmetric(
            horizontal: AppDimens.defaultPadding,
            vertical: AppDimens.paddingHuge,
          ),
        ));
  }
}
