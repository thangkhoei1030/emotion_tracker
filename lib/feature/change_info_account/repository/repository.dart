import 'package:get/get.dart';
import 'package:emotion_tracker/core/src_core.dart';
import 'package:flutter/material.dart';
import 'package:emotion_tracker/feature/src_feature.dart';

class ChangeInfoAccountRepository extends BaseRepository {
  ChangeInfoAccountRepository(super.controller);

  Future<BaseResponse> updateProfile(UpdateProfileRequest request) async {
    var response = await baseSendRequest(
      ApiUrl.updateProfile,
      RequestMethod.POST,
      jsonMap: request.toJson(),
    );
    print("object");
    return BaseResponse.fromJson(response);
  }
}
