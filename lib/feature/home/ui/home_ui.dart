import 'package:emotion_tracker/core/src_core.dart';
import 'package:emotion_tracker/feature/src_feature.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends BaseGetWidget<HomeController> {
  const HomePage({super.key});
  @override
  Widget buildWidgets(BuildContext context) {
    return UtilWidget.buildErrorOccurred(
      controller,
      isShowAppBar: false,
      onReload: controller.onReloadErrorOccured,
      isHaveData: () {
        return controller.userInfoResponse.value != UserInfoResponse();
      },
      child: PageScaffold(
        showAppBar: false,
        child: Obx(
          () => controller.isShowLoading.value
              ? const LoadingAnimationLottie(
                  animationDialogType: AnimationDialogType.quizLoading,
                  description: HomeStr.loadingDescription,
                )
              : SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UtilWidget.sizedBoxHeightSafeAreaTop(context),
                      const WelcomeComponent()
                          .paddingAll(AppDimens.defaultPadding),
                      UtilWidget.sizedBoxPadding,
                      const CreateTrackingComponent()
                          .paddingAll(AppDimens.defaultPadding),
                      UtilWidget.sizedBoxPadding,
                      const GrapEmotionComponent(),
                      UtilWidget.sizedBoxPadding,
                      const HomeSupportComponent()
                          .paddingAll(AppDimens.defaultPadding),
                      UtilWidget.sizedBoxHeightSafeAreaBottom(context),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
