import 'package:get/get.dart';
import 'package:emotion_tracker/core/src_core.dart';
import 'package:flutter/material.dart';
import 'package:emotion_tracker/feature/src_feature.dart';

class CongratulationControllerImp extends CongratulationController {
  @override
  void onInit() {
    emotionCompleteRepository = CongratulationRepository(this);
    super.onInit();
    _getInfoEmotionComplete();
  }

  Future<void> _getInfoEmotionComplete() async {
    try {
      showLoading();
      await Future.delayed(const Duration(seconds: 2));
      await emotionCompleteRepository.getResultQuiz().then((value) {
        if (value.data != null) {
          emotionCompleteResponse.value = value.data;
        }
      });
    } finally {
      hideLoading();
    }
  }

  @override
  Future<void> onReloadErrorOccured() async {
    super.onReloadErrorOccured();
    _getInfoEmotionComplete();
  }
}
