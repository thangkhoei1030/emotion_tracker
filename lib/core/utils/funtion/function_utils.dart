import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:emotion_tracker/core/src_core.dart';
import 'dart:convert' show utf8;

class FunctionUtils {
  static DateTime? _dateTime;

  static int _oldFunc = 0;

  static void runFunction(VoidCallback function) {
    DateTime now = DateTime.now();
    if (_dateTime == null ||
        now.difference(_dateTime ?? DateTime.now()) > 2.seconds ||
        function.hashCode != _oldFunc) {
      _dateTime = now;
      _oldFunc = function.hashCode;
      function.call();
    }
  }

  static Future<void> deleteOldController<T extends BaseGetxController>(
      {String? tag}) async {
    if (Get.isRegistered<T>(tag: tag)) {
      await Get.delete<T>(tag: tag);
    }
  }

  static Future<void> checkLogin(
      {required Future Function() funcWithLogin,
      Future Function()? funcWithoutLogin}) async {
    if (Get.find<AppController>().isLogin.value) {
      await funcWithLogin.call();
      return;
    }
    await funcWithoutLogin?.call();
  }

  static String unicodeDecode(String input) {
    var encoded = utf8.encode(input);
    return utf8.decode(encoded);
  }
}
