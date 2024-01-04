import 'package:get/get.dart';
import 'package:emotion_tracker/core/src_core.dart';

import 'package:emotion_tracker/feature/src_feature.dart';

abstract class CongratulationController extends BaseGetxController {
  late final CongratulationRepository emotionCompleteRepository;

  Rx<EmotionCompleteResponse?> emotionCompleteResponse = Rxn();

  double get percentOfPositive =>
      (emotionCompleteResponse.value?.pointPositive ?? 0) /
      (emotionCompleteResponse.value?.totalPointPositive ?? 1);

  double get percentOfNegative =>
      (emotionCompleteResponse.value?.pointNegative ?? 0) /
      (emotionCompleteResponse.value?.totalPointNegative ?? 1);
}
