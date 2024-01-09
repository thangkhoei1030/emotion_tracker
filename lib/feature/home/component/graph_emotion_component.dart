import 'package:emotion_tracker/core/src_core.dart';
import 'package:emotion_tracker/pages/src_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GrapEmotionComponent extends StatelessWidget {
  const GrapEmotionComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleButton(
      onPressed: () {
        Get.toNamed(AppRoutes.emotionStatisticalPage);
      },
      child: SizedBox(
        height: 170,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 15,
              child: CardBuilder(
                elevation: 8,
                backgroundColor: HexColor.fromHex("21CBB2"),
                height: 130,
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
                          children: [
                            Image.asset(ImageAsset.chartIcon),
                            UtilWidget.sizedBox10,
                            const TextBuild(
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
            Positioned(
              right: -20,
              top: -50,
              bottom: 0,
              child: Image.asset(ImageAsset.chartImage),
            ),
          ],
        ),
      ),
    );
  }
}
