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

  Future<void> sendAnswerToServer();

  void emotionChange(double value);

  Future<void> getQuiz();

  void nextQuestionOrSumary();

  bool get isFirstQuestion =>
      quizResponse.quizsDetail
          .where((element) => element.answer == null)
          .length ==
      totalQuestion.value;

  // bool get haveOnceQuestionNotDone =>
  //     quizResponse.quizsDetail
  //         .where((element) => element.answer == null)
  //         .length ==
  //     1;

  bool get isLastQuestion =>
      // haveOnceQuestionNotDone ||
      (numberQuestionAnswer == totalQuestion.value &&
          currentQuestionIndex.value == totalQuestion.value - 1);

  int get numberQuestionAnswer => quizResponse.quizsDetail
      .where((element) => element.answer != null)
      .length;
}
