import 'package:emotion_tracker/core/src_core.dart';
import 'package:emotion_tracker/feature/src_feature.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmotionStatisticalPage
    extends BaseGetWidget<EmotionStatisticalController> {
  const EmotionStatisticalPage({super.key});

  @override
  EmotionStatisticalController get controller =>
      Get.put(EmotionStatisticalControllerImp());

  @override
  Widget buildWidgets(BuildContext context) {
    return UtilWidget.buildErrorOccurred(
      controller,
      isHaveData: () => controller.emotionStatisticalResponse.isNotEmpty,
      onReload: controller.onReloadErrorOccured,
      child: PageScaffold(
        showAppBar: false,
        child: Obx(
          () => controller.isShowLoading.value
              ? const LoadingAnimationLottie(
                  animationDialogType: AnimationDialogType.quizLoading,
                  description:
                      "Chúng tôi đang thống kê lại cảm xúc của bạn\ntrong 7 ngày vừa qua",
                )
              : Stack(
                  children: [
                    Positioned.fill(
                      child: Container(
                        height: Get.height,
                        color: Colors.blue,
                      ),
                    ),
                    Positioned.fill(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: Get.height / 2,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                60,
                              ),
                              topRight: Radius.circular(60),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      controller: ScrollController(keepScrollOffset: true),
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CardBuilder(
                            width: 50,
                            radiusModel:
                                const RadiusModel(radiusAll: AppDimens.radius8),
                            onTap: Get.back,
                            elevation: 8,
                            paddingModel: const PaddingModel(
                                paddingAll: AppDimens.paddingSmall),
                            backgroundColor: Colors.white.withOpacity(0.4),
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ).paddingSymmetric(
                            horizontal: AppDimens.paddingSmallest,
                            vertical: AppDimens.paddingMedium,
                          ),
                          UtilWidget.sizedBoxPaddingHuge,
                          const EmotionOfDay(),
                          UtilWidget.sizedBoxPaddingHuge,
                          Column(
                            children: const [
                              EmotionStatistical(),
                              UtilWidget.sizedBoxPaddingHuge,
                              MusicRecommended(),
                              UtilWidget.sizedBoxPaddingHuge,
                              MusicRecommended(),
                              UtilWidget.sizedBoxPaddingHuge,
                              MusicRecommended(),
                            ],
                          ).paddingSymmetric(horizontal: AppDimens.paddingHuge)
                        ],
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
