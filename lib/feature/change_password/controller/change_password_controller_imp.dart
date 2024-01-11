import 'package:emotion_tracker/pages/src_pages.dart';
import 'package:get/get.dart';
import 'package:emotion_tracker/core/src_core.dart';
import 'package:emotion_tracker/feature/src_feature.dart';

class ChangePasswordControllerImp extends ChangePasswordController {
  @override
  void onInit() {
    changePasswordRepository = ChangePasswordRepository(this);
    super.onInit();
  }

  @override
  void changePassword() async {
    if ((formKey.currentState?.validate() ?? false) &&
        isInputFieldComplete.isTrue) {
      try {
        showLoadingOverlay();
        await _changePassword().then((value) {
          showToast(ProfileEditStr.changeInfoSuccess,
              toastStatus: ToastStatus.success);
          Get.offAllNamed(AppRoutes.loginPage);
        });
      } finally {
        hideLoadingOverlay();
      }
    }
  }

  Future<void> _changePassword() async {
    final ChangePasswordRequest changePasswordRequest = ChangePasswordRequest(
      newPassword: newPassCtr.text,
      oldPassword: oldPassCtr.text,
      rePassword: confirmNewPassCtr.text,
    );
    await changePasswordRepository.changePassword(changePasswordRequest);
  }
}
