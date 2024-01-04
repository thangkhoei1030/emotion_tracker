import 'package:emotion_tracker/core/src_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:emotion_tracker/feature/src_feature.dart';

abstract class EmotionTrackerController extends BaseGetxController {
  final Rx<int> totalQuestion = 0.obs;

  late final EmotionTrackerRepository emotionTrackerRepository;

  final RxList<Color> colorRandom = RxList.empty();
  Rx<int> currentQuestionIndex = 0.obs;

  Rx<double> currentEmotion = 0.0.obs;

  QuizResponse quizResponse = QuizResponse();

  void onQuestionChange(int index);

  void emotionChange(double value);

  Future<void> getQuiz();

  void nextQuestionOrSumary(int index);
}
