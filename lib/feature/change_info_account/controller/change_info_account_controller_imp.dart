import 'package:get/get.dart';
import 'package:emotion_tracker/core/src_core.dart';
import 'package:flutter/material.dart';
import 'package:emotion_tracker/feature/src_feature.dart';

class ChangeInfoAccountControllerImp extends ChangeInfoAccountController {
  @override
  void onInit() {
    initController();
    super.onInit();
  }

  void initController() {
    fullNameCtr.text = homeController.userInfoResponse.value.fullName ?? "";
    classCtr.text =
        homeController.userInfoResponse.value.classId?.toString() ?? "";
    emailCtr.text = homeController.userInfoResponse.value.email ?? "";
    phoneCtr.text = homeController.userInfoResponse.value.phone ?? "";
  }
}
