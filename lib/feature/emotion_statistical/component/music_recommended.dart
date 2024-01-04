import 'package:emotion_tracker/core/src_core.dart';
import 'package:flutter/material.dart';

class MusicRecommended extends StatelessWidget {
  const MusicRecommended({super.key});

  @override
  Widget build(BuildContext context) {
    return CardBuilder(
      radiusModel: const RadiusModel(
        radiusAll: AppDimens.radius20,
      ),
      paddingModel: const PaddingModel(
        paddingHorizontal: AppDimens.defaultPadding,
        paddingVerical: AppDimens.paddingSmall,
      ),
      backgroundColor: Colors.lightBlueAccent.withOpacity(0.1),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextBuild(
                  title: "On my mind",
                  textColor: Colors.blue,
                  fontSize: AppDimens.sizeTextLarge,
                  isBoldText: true,
                ),
                UtilWidget.sizedBoxPadding,
                Row(
                  children: const [
                    CardBuilder(
                      paddingModel: PaddingModel(
                        paddingVerical: AppDimens.paddingVerySmallest,
                        paddingHorizontal: AppDimens.paddingSmall,
                      ),
                      radiusModel: RadiusModel(
                        radiusAll: AppDimens.radius8,
                      ),
                      child: TextBuild(
                        title: "4 phut",
                        textColor: Colors.blue,
                      ),
                    ),
                    UtilWidget.sizedBoxWidthPadding,
                    CardBuilder(
                      paddingModel: PaddingModel(
                        paddingVerical: AppDimens.paddingVerySmallest,
                        paddingHorizontal: AppDimens.paddingSmall,
                      ),
                      radiusModel: RadiusModel(
                        radiusAll: AppDimens.radius8,
                      ),
                      child: TextBuild(
                        title: "4 phut",
                        textColor: Colors.blue,
                      ),
                    )
                  ],
                )
              ],
            ),
            AnimationDialog(
              height: 75,
              animationDialogType: AnimationDialogType.listenMusic,
            )
          ],
        ),
      ),
    );
  }
}
