import 'package:emotion_tracker/feature/src_feature.dart';
import 'package:emotion_tracker/pages/src_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class EmotionTrackerControllerImp extends EmotionTrackerController {
  @override
  void onInit() async {
    super.onInit();
    _initController();
    await getQuiz();
  }

  void _initController() {
    colorRandom.value = List.generate(
      20,
      (index) => Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1.0),
    );
    emotionTrackerRepository = EmotionTrackerRepository(this);
  }

  @override
  Future<void> getQuiz() async {
    try {
      showLoading();
      await Future.delayed(const Duration(seconds: 3));
      await emotionTrackerRepository.getQuiz().then((value) {
        if (value.data != null) {
          quizResponse = value.data!;
          totalQuestion.value = quizResponse.quizsDetail.length;
        }
      });
    } finally {
      hideLoading();
    }
  }

  @override
  Future<void> onReloadErrorOccured() async {
    super.onReloadErrorOccured();
    await getQuiz();
  }

  @override
  void onQuestionChange(int index) async {
    var questionForAnswer = quizResponse.quizsDetail[index];
    AnswerRequest answerRequest = AnswerRequest(
      answer: currentEmotion.value.ceil() + 1,
      questionId: questionForAnswer.questionId,
      quizId: quizResponse.id,
    );

    currentEmotion.value = 0;
    try {
      await emotionTrackerRepository.sendAnswer(answerRequest).then((value) {
        print("done");
      });
    } finally {
      print(quizResponse.quizsDetail.map((e) => e.answer));
    }
  }

  @override
  void emotionChange(double value) {
    currentEmotion.value = value;
  }

  @override
  void nextQuestionOrSumary(int index) {
    quizResponse.quizsDetail[index] = quizResponse.quizsDetail[index].copyWith(
      isAnswerDone: true,
      answer: currentEmotion.value.ceil() + 1,
    );
    try {
      onQuestionChange(index);
    } finally {
      if (index != totalQuestion.value - 1) {
        currentQuestionIndex.value++;
      }
      currentEmotion.value = (quizResponse
                  .quizsDetail[currentQuestionIndex.value].answer
                  ?.toDouble() ??
              1) -
          1;
    }

    if (index == totalQuestion.value - 1) {
      Get.offAndToNamed(AppRoutes.congratulationQuiz);
    }
  }
}
