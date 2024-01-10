import 'package:get/get.dart';
import 'package:emotion_tracker/core/src_core.dart';
import 'package:flutter/material.dart';
import 'package:emotion_tracker/feature/src_feature.dart';

abstract class ChangePasswordController extends BaseGetxController {
  late final ChangePasswordRepository changePasswordRepository;

  final GlobalKey<FormState> formKey = GlobalKey();

  RxBool isInputFieldComplete = false.obs;

  final TextEditingController oldPassCtr = TextEditingController();

  final FocusNode oldPassNode = FocusNode();

  final TextEditingController newPassCtr = TextEditingController();

  final FocusNode newPassNode = FocusNode();

  final TextEditingController confirmNewPassCtr = TextEditingController();

  final FocusNode confirmPassNode = FocusNode();

  void listendTextController() {
    isInputFieldComplete.value = oldPassCtr.text.isStringNotEmpty &&
        newPassCtr.text.isStringNotEmpty &&
        confirmNewPassCtr.text.isStringNotEmpty;
  }

  void changePassword();
}
