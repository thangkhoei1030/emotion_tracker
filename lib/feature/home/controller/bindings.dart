import 'package:emotion_tracker/feature/src_feature.dart';
import 'package:get/get.dart';

class HomeControllerBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeControllerImp());
  }
}
