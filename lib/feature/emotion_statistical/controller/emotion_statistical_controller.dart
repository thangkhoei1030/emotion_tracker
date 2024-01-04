import 'package:get/get.dart';
import 'package:emotion_tracker/core/src_core.dart';
import 'package:flutter/material.dart';
import 'package:emotion_tracker/feature/src_feature.dart';

abstract class EmotionStatisticalController extends BaseGetxController {
  late final EmotionStatisticalRepository emotionStatisticalRepository;

  RxList<EmotionStatisticalResponse> emotionStatisticalResponse =
      RxList.empty();
}
