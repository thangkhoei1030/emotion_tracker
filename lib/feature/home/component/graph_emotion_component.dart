import 'package:emotion_tracker/core/src_core.dart';
import 'package:emotion_tracker/pages/src_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class GrapEmotionComponent extends StatelessWidget {
  const GrapEmotionComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleButton(
      onPressed: () {
        Get.toNamed(AppRoutes.emotionStatisticalPage);
      },
      child: SizedBox(
        height: 150,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 15,
              child: CardBuilder(
                elevation: 8,
                backgroundColor: HexColor.fromHex("21cbb2"),
                height: 100,
                radiusModel: const RadiusModel(radiusAll: AppDimens.radius20),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppDimens.paddingSmall,
                          vertical: AppDimens.defaultPadding,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            TextBuild(
                              title: "Biểu đồ cảm xúc",
                              textColor: Colors.white,
                              fontSize: AppDimens.sizeTextMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
              ).paddingSymmetric(horizontal: AppDimens.defaultPadding),
            ),
            const Positioned(
              right: 0,
              top: -30,
              bottom: 0,
              child: AnimationDialog(
                animationDialogType: AnimationDialogType.graph,
                repeat: true,
                height: 400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
