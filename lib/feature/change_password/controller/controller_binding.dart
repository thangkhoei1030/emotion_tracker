import 'package:get/get.dart';

import 'package:emotion_tracker/feature/src_feature.dart';

class ChangePasswordControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangePasswordController>(() => ChangePasswordControllerImp());
  }
}
