import 'package:emotion_tracker/core/src_core.dart';
import 'package:emotion_tracker/pages/src_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateTrackingComponent extends StatelessWidget {
  const CreateTrackingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return CardBuilder(
        elevation: 8,
        radiusModel: const RadiusModel(
          radiusAll: AppDimens.radius20,
        ),
        paddingModel: const PaddingModel(
          paddingVerical: AppDimens.defaultPadding,
        ),
        boxShadow: AppColors.listDefaultShadow,
        backgroundColor: HexColor.fromHex("324bca")!.withOpacity(0.8),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextBuild(
                      title: DateTimeFormat().convertToString(
                          DateTime.now(), DateTimePattern.PATTERN_1),
                      textColor: Colors.white,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        TextBuild(
                          title: "Hôm nay bạn cảm thấy như thế nào",
                          textColor: Colors.white,
                          textAlign: TextAlign.start,
                        ),
                        UtilWidget.sizedBox10,
                        TextBuild(
                          title: "Tạo khảo sát",
                          isBoldText: true,
                          fontSize: AppDimens.sizeTextMedium,
                          textColor: Colors.white,
                        )
                      ],
                    ),
                    FloatingActionButton(
                      backgroundColor: context.backGroundCardColor.withOpacity(
                        0.75,
                      ),
                      onPressed: () {
                        Get.toNamed(AppRoutes.emotionTrackerPage);
                      },
                      child: Icon(
                        Icons.add,
                        color: context.backGroundCardColor,
                      ),
                    )
                  ],
                ).paddingSymmetric(horizontal: AppDimens.paddingSmall),
              ),
              const Expanded(
                child: AnimationDialog(
                  animationDialogType: AnimationDialogType.happHome,
                ),
              ),
            ],
          ),
        ));
  }
}
