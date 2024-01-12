import 'package:emotion_tracker/feature/src_feature.dart';
import 'package:get/get.dart';

class ProfileEditControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileEditController>(() => ProfileEditControllerImp());
  }
}
