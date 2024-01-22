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
      _nextPage(isNextPage: false);
      _updateEmotionFromNextQuestion();
    }
  }

  @override
  Future<void> onReloadErrorOccured() async {
    super.onReloadErrorOccured();
    await getQuiz();
  }

  @override
  Future<void> sendAnswerToServer(int index) async {
    var questionForAnswer = quizResponse.quizsDetail[index];

    var _oldEmotion = currentEmotion.value.ceil() + 1;

    AnswerRequest answerRequest = AnswerRequest(
      answer: _oldEmotion,
      questionId: questionForAnswer.questionId,
      quizId: quizResponse.id,
    );
    quizResponse.quizsDetail[index] = quizResponse.quizsDetail[index].copyWith(
      answer: _oldEmotion,
    );
    try {
      await emotionTrackerRepository.sendAnswer(answerRequest).then((value) {
        print("ok");
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
  void nextQuestionOrSumary(int index) async {
    try {
      sendAnswerToServer(index);
    } finally {
      if (isLastQuestion) {
        Get.toNamed(AppRoutes.congratulationQuiz);
      } else {
        _nextPage();
        _updateEmotionFromNextQuestion();
      }
    }
  }

  void _nextPage({bool isNextPage = true}) {
    int firstQuestionDontAnswer = quizResponse.quizsDetail
        .indexWhere((element) => element.answer == null);
    if (!isLastQuestion) {
      if (firstQuestionDontAnswer != -1) {
        currentQuestionIndex.value = firstQuestionDontAnswer;
      } else if (isNextPage) {
        currentQuestionIndex.value++;
      }
    } else {
      if (firstQuestionDontAnswer != -1) {
        currentQuestionIndex.value = firstQuestionDontAnswer;
      }
    }
  }

  void _updateEmotionFromNextQuestion() {
    currentEmotion.value = (quizResponse
                .quizsDetail[currentQuestionIndex.value].answer
                ?.toDouble() ??
            1) -
        1;
  }
}
