import 'package:emotion_tracker/feature/profile_edit/component/change_password_component.dart';
import 'package:get/get.dart';
import 'package:emotion_tracker/core/src_core.dart';
import 'package:flutter/material.dart';
import 'package:emotion_tracker/feature/src_feature.dart';

class ProfileEditPage extends BaseGetWidget<ProfileEditController> {
  const ProfileEditPage({super.key});
  @override
  ProfileEditController get controller => Get.put(ProfileEditControllerImp());
  @override
  Widget buildWidgets(BuildContext context) {
    return LoadingOverlayWidget(
      child: PageScaffold(
        showAppBar: true,
        showBackButton: true,
        title: const TextBuild(
          title: ProfileEditStr.title,
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const AvatarComponent(),
                    UtilWidget.sizedBoxPaddingHuge,
                    SimpleButton(
                      onPressed: () => controller.isChangePassword.toggle(),
                      child: const TextBuild(
                        isBoldText: true,
                        title: ProfileEditStr.changePassword,
                      ),
                    ),
                    UtilWidget.sizedBoxPaddingHuge,
                    Obx(
                      () => controller.isChangePassword.value
                          ? const ChangePasswordComponent()
                          : const SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
            ),
            BaseButton(
              function: controller.saveChange,
              titleButton: ProfileEditStr.saveChange,
            ).paddingSymmetric(
              horizontal: AppDimens.defaultPadding,
              vertical: AppDimens.paddingSmall,
            ),
            SizedBox(
              height: MediaQuery.of(context).viewInsets.bottom,
            ),
          ],
        ),
      ),
    );
  }
}
