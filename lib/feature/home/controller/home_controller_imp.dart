import 'package:emotion_tracker/core/src_core.dart';
import 'package:emotion_tracker/feature/src_feature.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeControllerImp extends HomeController {
  @override
  void onInit() async {
    homeRepository = HomeRepository(this);
    try {
      showLoading();
      await Future.delayed(const Duration(seconds: 2));
      await _getUserInfo();
    } finally {
      hideLoading();
    }
    super.onInit();
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
