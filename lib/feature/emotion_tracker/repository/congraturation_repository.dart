import 'package:get/get.dart';
import 'package:emotion_tracker/core/src_core.dart';
import 'package:flutter/material.dart';
import 'package:emotion_tracker/feature/src_feature.dart';

class CongratulationRepository extends BaseRepository {
  CongratulationRepository(super.controller);

  Future<BaseResponse<EmotionCompleteResponse>> getResultQuiz() async {
    var response =
        await baseSendRequest(ApiUrl.urlComplete, RequestMethod.POST);
    return BaseResponse.fromJson(
      response,
      func: (x) => EmotionCompleteResponse.fromJson(x),
    );
  }
}
