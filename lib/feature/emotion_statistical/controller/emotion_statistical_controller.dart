import 'package:get/get.dart';
import 'package:emotion_tracker/core/src_core.dart';

import 'package:emotion_tracker/feature/src_feature.dart';

abstract class EmotionStatisticalController extends BaseGetxController {
  final HomeController homeController = Get.find();

  late final EmotionStatisticalRepository emotionStatisticalRepository;

  final RxList<EmotionStatisticalResponse> emotionStatisticalResponse =
      RxList.empty();

  final RxInt currentDaySelect = 0.obs;
}
