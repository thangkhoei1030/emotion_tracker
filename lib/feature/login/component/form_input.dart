import 'package:emotion_tracker/feature/src_feature.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:emotion_tracker/core/src_core.dart';

class FormSignInWidget extends GetView<LoginController> {
  const FormSignInWidget({super.key});

  @override
  LoginControllerImp get controller => Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: CardBuilder(
        radiusModel: const RadiusModel(radiusAll: AppDimens.radius8),
        backgroundColor: Colors.transparent,
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image.asset(ImageAsset.dagoLogo, scale: 0.8),
              UtilWidget.sizedBoxPaddingHuge,
              if (MediaQuery.of(context).viewInsets.bottom == 0) ...[
                const TextBuild(
                  title: SignInStr.hello,
                  isBoldText: true,
                  fontSize: AppDimens.sizeTextVeryLarge,
                  textColor: Colors.white,
                ),
                const TextBuild(
                  title: SignInStr.descriptions,
                  textAlign: TextAlign.start,
                  isBoldText: true,
                  textColor: Colors.white,
                ),
              ],
              UtilWidget.sizedBoxPaddingHuge,
              Obx(
                () => BuildInputTextWithLabel(
                  label: SignInStr.account,
                  labelColor: Colors.white,
                  inputTextModel: InputTextModel(
                    fillColor: Colors.white,
                    controller: controller.usernameController,
                    enable: !controller.isShowLoading.value,
                    validator: (value) => validateInput(
                        nameField: SignInStr.account, value: value),
                  ),
                ),
              ),
              UtilWidget.sizedBoxPaddingHuge,
              Obx(
                () => BuildInputTextWithLabel(
                  label: SignInStr.password,
                  labelColor: Colors.white,
                  inputTextModel: InputTextModel(
                    fillColor: Colors.white,
                    enable: !controller.isShowLoading.value,
                    controller: controller.passwordController,
                    // labelText: SignInStr.password,
                    validator: (value) => validateInput(
                        nameField: SignInStr.password, value: value),
                    obscureText: true,
                  ),
                ),
              ),
              UtilWidget.sizedBoxPadding,
              Align(
                alignment: Alignment.centerRight,
                child: TextBuild(
                  title: SignInStr.forgotpassword,
                  fontSize: AppDimens.sizeTextDefault,
                  textColor: Colors.white,
                  isBoldText: true,
                  function: () {},
                ),
              ),
              UtilWidget.sizedBoxPaddingHuge,
              Obx(
                () => Align(
                  alignment: Alignment.center,
                  child: BaseButton(
                    function: controller.funcLogin,
                    titleButton: SignInStr.signIn,
                    elevation: 0,
                    backgroundColor: HexColor.fromHex("0025B1"),
                    colorText: Colors.white,
                    isShowLoading: true,
                    isLoading: controller.isShowLoading.value,
                  ),
                ),
              ),
              UtilWidget.sizedBoxPaddingHuge,
            ],
          ).paddingSymmetric(horizontal: AppDimens.defaultPadding),
        ),
      ),
    );
  }
}
