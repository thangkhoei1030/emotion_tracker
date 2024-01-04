import 'package:emotion_tracker/feature/src_feature.dart';
import 'package:get/get.dart';

class QuizOverviewControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuizOverviewController>(() => QuizOverviewControllerImp());
  }
}
