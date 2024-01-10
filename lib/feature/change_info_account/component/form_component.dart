import 'package:emotion_tracker/core/src_core.dart';
import 'package:emotion_tracker/feature/src_feature.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class FormComponentChangeInfoAccount
    extends GetView<ChangeInfoAccountController> {
  const FormComponentChangeInfoAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInputWithLabel(
          ChangeInfoAccountStr.fullName,
          InputTextModel(
            controller: controller.fullNameCtr,
            currentNode: controller.fullNameNode,
            nextNode: controller.emailNode,
          ),
        ),
        UtilWidget.sizedBoxPaddingMedium,
        _buildInputWithLabel(
          ChangeInfoAccountStr.className,
          InputTextModel(
            enable: false,
            controller: controller.classCtr,
          ),
        ),
        UtilWidget.sizedBoxPaddingMedium,
        _buildInputWithLabel(
          ChangeInfoAccountStr.email,
          InputTextModel(
            controller: controller.emailCtr,
            currentNode: controller.emailNode,
            nextNode: controller.phoneNode,
          ),
        ),
        UtilWidget.sizedBoxPaddingMedium,
        _buildInputWithLabel(
          ChangeInfoAccountStr.phoneNumb,
          InputTextModel(
            controller: controller.phoneCtr,
            currentNode: controller.phoneNode,
            iconNextTextInputAction: TextInputAction.done,
          ),
        ),
      ],
    );
  }

  Widget _buildInputWithLabel(
    String title,
    InputTextModel inputTextModel,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextBuild(
          title: title,
        ),
        TextFormField(
          style: Get.textTheme.bodySmall!.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          focusNode: inputTextModel.currentNode,
          textInputAction: inputTextModel.iconNextTextInputAction,
          onFieldSubmitted: (value) {
            if (inputTextModel.iconNextTextInputAction.toString() ==
                TextInputAction.next.toString()) {
              inputTextModel.nextNode?.requestFocus();

              inputTextModel.onNext?.call(value);
            } else {
              inputTextModel.submitFunc?.call(value);
            }
          },
          enabled: inputTextModel.enable,
          controller: inputTextModel.controller,
        ),
      ],
    );
  }
}
