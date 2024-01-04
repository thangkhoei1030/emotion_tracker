import 'package:emotion_tracker/core/src_core.dart';
import 'package:emotion_tracker/feature/src_feature.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:iconsax/iconsax.dart';

class BuildGridviewOverviewQuiz extends GetView<QuizOverviewController> {
  const BuildGridviewOverviewQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: controller.emotionTrackerController.totalQuestion.value,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 1,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
        ),
        itemBuilder: (context, index) {
          final quizDetail = controller
              .emotionTrackerController.quizResponse.quizsDetail[index];

          return SimpleButton(
            onPressed: () {
              controller.onGotoQuestion(index);
            },
            child: Stack(
              children: [
                NetworkImageWidget(
                  radiusImage: const RadiusModel(radiusAll: AppDimens.radius8),
                  backgroundColor: HexColor.fromHex(quizDetail.questionColor),
                  urlImage: quizDetail.questionIcon.toUrlCDN(),
                ).paddingAll(AppDimens.paddingVerySmall),
                if (quizDetail.isAnswerDone)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: CardBuilder(
                      alignment: Alignment.topRight,
                      backgroundColor: HexColor.fromHex("0071ff"),
                      radiusModel:
                          const RadiusModel(radiusAll: AppDimens.radiusDefault),
                      child: const Icon(
                        Iconsax.tick_circle,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
          );
        });
  }
}
