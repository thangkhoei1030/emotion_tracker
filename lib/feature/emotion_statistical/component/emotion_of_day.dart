import 'package:emotion_tracker/core/src_core.dart';
import 'package:emotion_tracker/feature/src_feature.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmotionOfDay extends GetView<EmotionStatisticalController> {
  const EmotionOfDay({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleListView(
      height: 110,
      scrollDirection: Axis.horizontal,
      data: List.generate(
          controller.emotionStatisticalResponse.length, (index) => index),
      itemBuilder: (context, index) {
        final DateTime emotionDate = DateTimeFormat().convertTimeStampToDate(
            controller.emotionStatisticalResponse[index].date ?? 0);
        return Obx(
          () => CardBuilder(
            onTap: () {
              controller.currentDaySelect.value = index;
            },
            linearGradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: AppColors.cardBackGroundStatiscalDay,
            ),
            borderColor: Colors.white,
            isBorder: controller.currentDaySelect.value == index,
            paddingModel:
                const PaddingModel(paddingHorizontal: AppDimens.paddingSmall),
            radiusModel: const RadiusModel(radiusAll: AppDimens.radius20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (controller
                    .emotionStatisticalResponse[index].icon.isStringNotEmpty)
                  NetworkImageWidget(
                    urlImage: controller.emotionStatisticalResponse[index].icon
                        .toUrlCDN(),
                    heightImage: 50,
                    widthImage: 50,
                  )
                else
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.white,
                          style: BorderStyle.solid,
                          width: 0.2,
                          strokeAlign: BorderSide.strokeAlignOutside),
                      borderRadius:
                          BorderRadius.circular(AppDimens.radiusDefault),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                TextBuild(
                  title: emotionDate.day.toString(),
                  textColor: Colors.white,
                ),
                TextBuild(
                  textColor: Colors.white,
                  title:
                      DateTimeFormat().getDayOfWeakFromDay(emotionDate.weekday),
                ),
              ],
            ),
          ).paddingSymmetric(horizontal: AppDimens.paddingVerySmall),
        );
      },
    );
  }
}
