import 'package:emotion_tracker/core/src_core.dart';
import 'package:emotion_tracker/feature/src_feature.dart';
import 'package:flutter/material.dart';

class MusicRecommended extends StatelessWidget {
  const MusicRecommended({super.key, required this.emotionStatisticalResponse});

  final EmotionStatisticalResponse emotionStatisticalResponse;

  @override
  Widget build(BuildContext context) {
    return emotionStatisticalResponse.description == null &&
            emotionStatisticalResponse.title == null
        ? const SizedBox.shrink()
        : CardBuilder(
            radiusModel: const RadiusModel(
              radiusAll: AppDimens.radius20,
            ),
            paddingModel: const PaddingModel(
              paddingHorizontal: AppDimens.defaultPadding,
              paddingVerical: AppDimens.paddingSmall,
            ),
            backgroundColor: Colors.lightBlueAccent.withOpacity(0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextBuild(
                  title: emotionStatisticalResponse.title ?? "",
                  textColor: Colors.blue,
                  textAlign: TextAlign.start,
                  fontSize: AppDimens.sizeTextLarge,
                  isBoldText: true,
                ),
                UtilWidget.sizedBoxPadding,
                TextBuild(
                  title: emotionStatisticalResponse.description ?? "",
                  textColor: Colors.blue,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          );
  }
}
