import 'package:emotion_tracker/pages/src_pages.dart';
import 'package:get/get.dart';
import 'package:emotion_tracker/core/src_core.dart';
import 'package:emotion_tracker/feature/src_feature.dart';
import 'package:image_picker/image_picker.dart';

class ProfileEditControllerImp extends ProfileEditController {
  @override
  void onInit() {
    profileEditRepository = ProfileEditRepository(this);
    super.onInit();
  }

  @override
  Future<void> pickImage(ImageSource source) async {
    Get.close(1);
    await imagePicker.pickImage(source: source).then((value) async {
      image.value = value;
    });
  }

  Future<void> _changePassword() async {
    final ChangePasswordRequest changePasswordRequest = ChangePasswordRequest(
      newPassword: newPassCtr.text,
      oldPassword: oldPassCtr.text,
      rePassword: confirmNewPassCtr.text,
    );
    await profileEditRepository.changePassword(changePasswordRequest);
  }

  Future<void> _updateAvatar() async {
    if (image.value != null) {
      await profileEditRepository.updateAvatar(xfile: image.value);
    }
  }

  Future<void> _saveChangePasswordAndAvatar() async {
    if (formKey.currentState?.validate() ?? false) {
      await _changePassword();
      await _updateAvatar();
      showToast(ProfileEditStr.changeInfoSuccess,
          toastStatus: ToastStatus.success);
      Get.offAllNamed(AppRoutes.loginPage);
    }
  }

  @override
  Future<void> saveChange() async {
    try {
      showLoadingOverlay();
      if (isChangePassword.isTrue) {
        await _saveChangePasswordAndAvatar();
      } else {
        await _updateAvatar();
        showToast(ProfileEditStr.changeInfoSuccess,
            toastStatus: ToastStatus.success);
        Get.back(result: true);
      }
    } finally {
      hideLoadingOverlay();
    }
  }
}
