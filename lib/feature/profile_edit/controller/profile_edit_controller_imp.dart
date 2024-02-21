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
      await _updateAvatar(value);
    });
  }

  Future<void> _updateAvatar(XFile? file) async {
    try {
      showLoadingOverlay();
      if (file != null) {
        await profileEditRepository.updateAvatar(xfile: file).then((value) {
          homeController.updateUser();
          showToast(ProfileEditStr.changeInfoSuccess,
              toastStatus: ToastStatus.success);
        });
      }
    } finally {
      hideLoadingOverlay();
    }
  }

  // Future<void> _saveChangePasswordAndAvatar() async {
  //   if (formKey.currentState?.validate() ?? false) {
  //     await _updateAvatar();

  //     Get.offAllNamed(AppRoutes.loginPage);
  //   }
  // }

  @override
  Future<void> logOut() async {
    APP_DATA.delete(AppConst.keyUserName);
    APP_DATA.delete(AppConst.keyUserpassword);
    Get.offAllNamed(AppRoutes.loginPage);
  }
}
