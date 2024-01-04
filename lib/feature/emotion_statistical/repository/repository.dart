import 'package:get/get.dart';
import 'package:emotion_tracker/core/src_core.dart';
import 'package:flutter/material.dart';
import 'package:emotion_tracker/feature/src_feature.dart';

class EmotionStatisticalRepository extends BaseRepository {
  EmotionStatisticalRepository(super.controller);

  Future<BaseResponseList<EmotionStatisticalResponse>>
      getEmotionStatisticalOfWeek() async {
    var response =
        await baseSendRequest(ApiUrl.urlStatistical, RequestMethod.POST);
    return BaseResponseList.fromJson(
      response,
      (x) => EmotionStatisticalResponse.fromJson(x),
    );
  }
}
