import 'package:get/get.dart';
import 'package:emotion_tracker/core/src_core.dart';
import 'package:flutter/material.dart';
import 'package:emotion_tracker/feature/src_feature.dart';

class ChangePasswordComponent extends GetView<ProfileEditController> {
  const ChangePasswordComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildInputTextWithLabel(
            label: "Mật khẩu cũ",
            labelRequired: "*",
            inputTextModel: InputTextModel(
              currentNode: controller.oldPassNode,
              nextNode: controller.newPassNode,
              controller: controller.oldPassCtr,
              obscureText: true,
              validator: (value) =>
                  validateInput(nameField: "Mật khẩu cũ", value: value),
            ),
          ),
          UtilWidget.sizedBoxPadding,
          BuildInputTextWithLabel(
            label: "Mật khẩu mới",
            labelRequired: "*",
            inputTextModel: InputTextModel(
              currentNode: controller.newPassNode,
              nextNode: controller.confirmPassNode,
              controller: controller.newPassCtr,
              obscureText: true,
              validator: (value) =>
                  validateInput(nameField: "Mật khẩu mới", value: value),
            ),
          ),
          UtilWidget.sizedBoxPadding,
          BuildInputTextWithLabel(
            labelRequired: "*",
            label: "Xác nhận mật khẩu",
            inputTextModel: InputTextModel(
              currentNode: controller.confirmPassNode,
              controller: controller.confirmNewPassCtr,
              obscureText: true,
              validator: (value) =>
                  validateInput(nameField: "Xác nhận mật khẩu", value: value),
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: AppDimens.defaultPadding),
    );
  }
}
