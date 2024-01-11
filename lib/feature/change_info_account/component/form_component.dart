import 'package:emotion_tracker/core/src_core.dart';
import 'package:emotion_tracker/feature/src_feature.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class FormComponentChangeInfoAccount
    extends GetView<ChangeInfoAccountController> {
  const FormComponentChangeInfoAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formState,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildInputWithLabelChangeInfo(
            ChangeInfoAccountStr.fullName,
            InputTextModel(
              validator: (value) => validateInput(
                  value: value, nameField: ChangeInfoAccountStr.fullName),
              controller: controller.fullNameCtr,
              currentNode: controller.fullNameNode,
              nextNode: controller.emailNode,
            ),
          ),
          UtilWidget.sizedBoxPaddingMedium,
          BuildInputWithLabelChangeInfo(
            ChangeInfoAccountStr.className,
            InputTextModel(
              enable: false,
              controller: controller.classCtr,
            ),
          ),
          UtilWidget.sizedBoxPaddingMedium,
          BuildInputWithLabelChangeInfo(
            ChangeInfoAccountStr.email,
            InputTextModel(
              validator: (value) => emailValidate(value),
              controller: controller.emailCtr,
              currentNode: controller.emailNode,
              nextNode: controller.phoneNode,
            ),
          ),
          UtilWidget.sizedBoxPaddingMedium,
          BuildInputWithLabelChangeInfo(
            ChangeInfoAccountStr.phoneNumb,
            InputTextModel(
              validator: (value) {
                return phoneValidate(value);
              },
              controller: controller.phoneCtr,
              currentNode: controller.phoneNode,
              iconNextTextInputAction: TextInputAction.done,
            ),
          ),
          UtilWidget.sizedBox30,
        ],
      ),
    );
  }
}

class BuildInputWithLabelChangeInfo extends StatelessWidget {
  const BuildInputWithLabelChangeInfo(
    this.title,
    this.inputTextModel, {
    super.key,
  });
  final String title;
  final InputTextModel inputTextModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextBuild(
          title: title,
        ),
        TextFormField(
          validator: inputTextModel.validator,
          style: Get.textTheme.bodySmall!.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          autovalidateMode: AutovalidateMode.always,
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
