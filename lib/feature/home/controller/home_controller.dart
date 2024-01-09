import 'package:emotion_tracker/core/src_core.dart';
import 'package:emotion_tracker/feature/src_feature.dart';
import 'package:get/get.dart';

abstract class HomeController extends BaseGetxController {
  late final HomeRepository homeRepository;

  Rx<UserInfoResponse> userInfoResponse = UserInfoResponse().obs;

  void updateUser();
}
