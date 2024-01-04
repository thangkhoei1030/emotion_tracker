import 'package:get/get.dart';
import 'package:emotion_tracker/core/src_core.dart';
import 'package:flutter/material.dart';
import 'package:emotion_tracker/feature/src_feature.dart';

class EmotionStatisticalControllerImp extends EmotionStatisticalController {
  @override
  void onInit() {
    emotionStatisticalRepository = EmotionStatisticalRepository(this);
    super.onInit();
    _getStatistical();
  }

  @override
  Future<void> onReloadErrorOccured() async {
    await _getStatistical();
  }

  Future<void> _getStatistical() async {
    try {
      showLoading();
      await emotionStatisticalRepository
          .getEmotionStatisticalOfWeek()
          .then((value) {
        if (value.data.isNotEmpty) {
          emotionStatisticalResponse.value = value.data;
        }
      });
    } finally {
      hideLoading();
    }
  }
}
