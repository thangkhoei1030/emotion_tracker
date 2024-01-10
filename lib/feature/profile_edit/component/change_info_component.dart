import 'package:emotion_tracker/core/src_core.dart';
import 'package:emotion_tracker/pages/src_pages.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:emotion_tracker/feature/src_feature.dart';

class ChangeInfoComponent extends GetView<ProfileEditController> {
  const ChangeInfoComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetWithTile(
      colorTitle: Colors.white,
      titleLeading: ProfileEditStr.info.toUpperCase(),
      trailing: SimpleButton(
        onPressed: () {
          Get.toNamed(AppRoutes.changeInfoAccount);
        },
        child: const TextBuild(
          title: ProfileEditStr.fix,
          textColor: Colors.white,
        ),
      ),
      widgetPadding: UtilWidget.sizedBox10,
      content: CardBuilder(
        backgroundColor: Colors.white,
        paddingModel: const PaddingModel(
            paddingHorizontal: AppDimens.defaultPadding,
            paddingVerical: AppDimens.paddingMedium),
        radiusModel: const RadiusModel(radiusAll: AppDimens.radius8),
        child: Column(
          children: [
            UtilWidget.sizedBox17,
            BuildTextRow(
              textLeading: ProfileEditStr.fullName,
              textTrailing:
                  controller.homeController.userInfoResponse.value.fullName ??
                      "",
              textColor: Colors.black,
              textSize: AppDimens.sizeTextMedium,
            ),
            UtilWidget.sizedBox17,
            BuildTextRow(
              textLeading: ProfileEditStr.className,
              textTrailing: controller
                      .homeController.userInfoResponse.value.classId
                      ?.toString() ??
                  "",
              textColor: Colors.black,
              textSize: AppDimens.sizeTextMedium,
            ),
            UtilWidget.sizedBox17,
            BuildTextRow(
              textLeading: ProfileEditStr.email,
              textTrailing:
                  controller.homeController.userInfoResponse.value.email ?? "",
              textColor: Colors.black,
              textSize: AppDimens.sizeTextMedium,
            ),
            UtilWidget.sizedBox17,
            BuildTextRow(
              textLeading: ProfileEditStr.phoneNumber,
              textTrailing:
                  controller.homeController.userInfoResponse.value.phone ??
                      "Trống",
              textColor: Colors.black,
              textSize: AppDimens.sizeTextMedium,
            ),
          ],
        ),
      ),
    );
  }
}
