import 'package:emotion_tracker/core/src_core.dart';
import 'package:emotion_tracker/feature/src_feature.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeControllerImp extends HomeController {
  @override
  void onInit() async {
    super.onInit();
    homeRepository = HomeRepository(this);
    try {
      showLoading();
      await _getUserInfo();
    } finally {
      hideLoading();
    }
  }

  Future<void> _getUserInfo() async {
    await homeRepository.getUserResponse().then((value) {
      if (value.data != null) {
        userInfoResponse.value = value.data!;
      }
    });
  }

  @override
  Future<void> onReloadErrorOccured() async {
    super.onReloadErrorOccured();
    try {
      showLoading();
      await _getUserInfo();
    } finally {
      hideLoading();
    }
  }

  @override
  void updateUser() => _getUserInfo();
}
