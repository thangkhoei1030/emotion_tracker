import 'package:emotion_tracker/feature/src_feature.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:emotion_tracker/core/src_core.dart';

class ForgotPasswordPage extends BaseGetWidget<ForgotPasswordController> {
  const ForgotPasswordPage({super.key});
  @override
  ForgotPasswordController get controller =>
      Get.put(ForgotPasswordControllerImp());

  @override
  Widget buildWidgets(BuildContext context) {
    return LoadingOverlayWidget(
      child: PageScaffold(
        showAppBar: true,
        showBackButton: true,
        title: const TextBuild(title: SignInStr.forgotpassword),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BuildInputText(
              InputTextModel(
                fillColor: Colors.transparent,
                controller: controller.emailController,
                labelText: SignInStr.email,
                validator: (value) =>
                    validateInput(nameField: SignInStr.email, value: value),
              ),
            ),
            UtilWidget.sizedBox10,
            BaseButton(
              backgroundColor: Colors.cyan,
              function: () => {},
              // function: controller.checkEmail,
              titleButton: "SettingStr.sendEmail",
            ).paddingSymmetric(
                horizontal: AppDimens.defaultPadding,
                vertical: AppDimens.paddingMedium)
          ],
        ).paddingSymmetric(
          horizontal: AppDimens.defaultPadding,
          vertical: AppDimens.paddingMedium,
        ),
      ),
    );
  }
}
