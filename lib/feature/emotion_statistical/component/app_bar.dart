import 'package:emotion_tracker/core/src_core.dart';
import 'package:emotion_tracker/feature/emotion_statistical/values/strings.dart';
import 'package:emotion_tracker/feature/src_feature.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildAppBarEmotionStatistical
    extends GetView<EmotionStatisticalController> {
  const BuildAppBarEmotionStatistical({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.emotionStatisticalBackgroundColor,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          UtilWidget.sizedBoxHeightSafeAreaTop(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardBuilder(
                width: 50,
                height: 50,
                radiusModel: const RadiusModel(radiusAll: AppDimens.radius8),
                onTap: Get.back,
                elevation: 8,
                paddingModel:
                    const PaddingModel(paddingAll: AppDimens.paddingSmall),
                backgroundColor: Colors.white.withOpacity(0.4),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              const TextBuild(
                title: EmotionStatisticalStr.title,
                textColor: Colors.white,
              ),
              NetworkImageWidget(
                widthImage: 50,
                widgetImageBuilder: (context, imageProvider) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
                urlImage:
                    (controller.homeController.userInfoResponse.value.avatar ??
                            "")
                        .toUrlCDN(),
              ),
            ],
          ).paddingSymmetric(horizontal: AppDimens.paddingSmall),
          UtilWidget.sizedBox10,
        ],
      ),
    );
  }
}
