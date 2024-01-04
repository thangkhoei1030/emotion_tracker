import 'package:emotion_tracker/pages/src_pages.dart';
import 'package:get/get.dart';
import 'package:emotion_tracker/core/src_core.dart';
import 'package:emotion_tracker/feature/src_feature.dart';

abstract class QuizOverviewController extends BaseGetxController {
  final EmotionTrackerController emotionTrackerController = Get.find();
  void onDoneQuiz() {
    Get.close(1);
    Get.offAndToNamed(AppRoutes.congratulationQuiz);
  }

  void onGotoQuestion(int index) {
    emotionTrackerController.currentQuestionIndex.value = index;
    Get.back();
  }
}
