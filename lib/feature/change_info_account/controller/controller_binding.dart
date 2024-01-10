import 'package:get/get.dart';
import 'package:emotion_tracker/feature/src_feature.dart';

class ChangeInfoAccountControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangeInfoAccountController>(
        () => ChangeInfoAccountControllerImp());
  }
}
