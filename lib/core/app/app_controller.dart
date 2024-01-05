import 'package:emotion_tracker/core/src_core.dart';
import 'package:emotion_tracker/main.dart';
import 'package:emotion_tracker/pages/src_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:emotion_tracker/feature/src_feature.dart';

late final Box APP_DATA;

final GetStorage getStorage = GetStorage();

String path = '';

class AppController extends GetxController {
  final RxBool isLogin = false.obs;

  final RxBool isDarkMode = false.obs;

  @override
  void onInit() {
    _initHive().then((value) async {
      isDarkMode.value = APP_DATA.get(AppConst.keyDarkMode) ?? false;

      Get.put(BaseRequest(), permanent: true);
      Get.put(BaseGetxController(), permanent: true);
      if (APP_DATA.get(AppConst.keyUserName) != null) {
        await _login();
      } else {
        FlutterNativeSplash.remove();
        Get.toNamed(AppRoutes.loginPage);
      }
    });

    super.onInit();
  }

  Future<void> _login() async {
    LoginRepository loginRepository = LoginRepository(
      Get.put(BaseGetxController(), permanent: true),
    );

    try {
      await loginRepository
          .login(
        LoginRequest(
          userName: APP_DATA.get(AppConst.keyUserName),
          password: APP_DATA.get(AppConst.keyUserpassword),
        ),
      )
          .then((value) async {
        if (value != null) {
          FlutterNativeSplash.remove();
          await CookiesSingleton().createCookiesForUser();
          await _loginSuccess();
        }
      });
    } catch (e) {
      FlutterNativeSplash.remove();
      Get.toNamed(AppRoutes.loginPage);
    }
  }

  Future<void> _loginSuccess() async {
    Get.toNamed(AppRoutes.homePage);
  }

  Future<void> _initHive() async {
    await _openBox();
  }

  Future<void> _openBox() async {
    final appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path + AppStr.appName);
    APP_DATA =
        await Hive.openBox(AppStr.appName, path: appDocumentDirectory.path);
  }
}
