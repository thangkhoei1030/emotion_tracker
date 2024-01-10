import 'package:get/get.dart';
import 'package:emotion_tracker/core/src_core.dart';
import 'package:flutter/material.dart';
import 'package:emotion_tracker/feature/src_feature.dart';

class ChangePasswordRepository extends BaseRepository {
  ChangePasswordRepository(super.controller);

  Future<BaseResponse> changePassword(ChangePasswordRequest request) async {
    var response = await baseSendRequest(
      ApiUrl.changePassword,
      RequestMethod.POST,
      jsonMap: request.toJson(),
    );
    return BaseResponse.fromJson(response);
  }
}
