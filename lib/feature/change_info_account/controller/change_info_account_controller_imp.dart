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
    changeInfoAccountRepository = ChangeInfoAccountRepository(this);
    fullNameCtr.text = homeController.userInfoResponse.value.fullName ?? "";
    classCtr.text =
        homeController.userInfoResponse.value.classId?.toString() ?? "";
    emailCtr.text = homeController.userInfoResponse.value.email ?? "";
    phoneCtr.text = homeController.userInfoResponse.value.phone ?? "";
  }

  @override
  void updateInfo() async {
    if (formState.currentState?.validate() ?? false) {
      updateProfileRequest = updateProfileRequest.copyWith(
        fullName: fullNameCtr.text,
        email: emailCtr.text,
        phone: phoneCtr.text,
      );
      try {
        showLoadingOverlay();
        await changeInfoAccountRepository
            .updateProfile(updateProfileRequest)
            .then((value) {
          showToast(value.message ?? "", toastStatus: ToastStatus.success);
          Get.back(result: true);
        });
      } finally {
        hideLoadingOverlay();
      }
    }
  }
}
