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
      isShowAppBar: true,
      child: PageScaffold(
        showAppBar: false,
        backgroundColor: Colors.transparent,
        child: Obx(
          () => controller.isShowLoading.value
              ? const LoadingAnimationLottie(
                  animationDialogType: AnimationDialogType.quizLoading,
                  description: EmotionStatisticalStr.descriptionLoading,
                )
              : Stack(
                  children: [
                    Positioned.fill(
                      child: Container(
                        height: Get.height,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: AppColors.emotionStatisticalBackgroundColor,
                        )),
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
                    CustomScrollView(
                      physics: const BouncingScrollPhysics(),
                      slivers: [
                        const SliverAppBar(
                          centerTitle: true,
                          pinned: true,
                          automaticallyImplyLeading: false,
                          toolbarHeight: 75,
                          flexibleSpace: BuildAppBarEmotionStatistical(),
                        ),
                        SliverList(
                            delegate: SliverChildListDelegate([
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              UtilWidget.sizedBoxPaddingHuge,
                              const EmotionOfDay(),
                              UtilWidget.sizedBoxPaddingHuge,
                              Column(
                                children: [
                                  const EmotionStatistical(),
                                  UtilWidget.sizedBoxPaddingHuge,
                                  MusicRecommended(
                                    emotionStatisticalResponse:
                                        controller.emotionStatisticalResponse[
                                            controller.currentDaySelect.value],
                                  ),
                                ],
                              ).paddingSymmetric(
                                  horizontal: AppDimens.paddingHuge),
                              UtilWidget.sizedBoxHeightSafeAreaBottom(context),
                            ],
                          ),
                        ]))
                      ],
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
