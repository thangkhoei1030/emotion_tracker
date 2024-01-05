import 'dart:io';

import 'package:emotion_tracker/main.dart';
import 'package:get/get.dart';
import 'package:emotion_tracker/core/src_core.dart';

class CookiesSingleton {
  static CookiesSingleton? _instance;

  factory CookiesSingleton() => _instance ??= CookiesSingleton._();

  CookiesSingleton._();

  final String defaultPathCookies = "cookies";

  Future<void> createCookiesForUser({String? userName}) async {
    try {
      String pathAccount =
          "$defaultPathCookies/${(userName ?? APP_DATA.get(AppConst.keyUserName)).toString().toLowerCase()}";
      print("'$applicationPath/$pathAccount'");
      await Directory('$applicationPath/$pathAccount').create().then((cookies) {
        path = cookies.path;
        print(path);
        Get.find<BaseRequest>().updateCurrentDio();
      });
    } catch (e) {
      if (e is PathNotFoundException) {
        print(e.toString());
        await Directory('$applicationPath/$defaultPathCookies').create();
        await createCookiesForUser(userName: userName);
      }
    }
  }
}
