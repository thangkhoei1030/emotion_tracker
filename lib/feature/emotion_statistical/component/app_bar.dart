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
      child: Row(
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
            urlImage:
                controller.homeController.userInfoResponse.value.avatar ?? "",
          )
        ],
      ).paddingSymmetric(horizontal: AppDimens.paddingSmall),
    );
  }
}
