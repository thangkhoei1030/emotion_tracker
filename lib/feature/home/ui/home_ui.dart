import 'package:emotion_tracker/core/src_core.dart';
import 'package:emotion_tracker/feature/src_feature.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends BaseGetWidget<HomeController> {
  const HomePage({super.key});
  @override
  HomeController get controller => Get.put(HomeControllerImp());
  @override
  Widget buildWidgets(BuildContext context) {
    return PageScaffold(
      showAppBar: false,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WelcomeComponent().paddingAll(AppDimens.defaultPadding),
            UtilWidget.sizedBoxPadding,
            const CreateTrackingComponent()
                .paddingAll(AppDimens.defaultPadding),
            UtilWidget.sizedBoxPadding,
            const GrapEmotionComponent(),
            UtilWidget.sizedBoxPadding,
            const HomeSupportComponent().paddingAll(AppDimens.defaultPadding),
          ],
        ),
      ),
    );
  }
}
