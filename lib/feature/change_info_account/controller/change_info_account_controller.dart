import 'package:emotion_tracker/core/src_core.dart';
import 'package:emotion_tracker/feature/src_feature.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ChangeInfoAccountController extends BaseGetxController {
  late final ChangeInfoAccountRepository changeInfoAccountRepository;

  final HomeController homeController = Get.find();

  final GlobalKey<FormState> formState = GlobalKey<FormState>();

  final TextEditingController fullNameCtr = TextEditingController();

  final FocusNode fullNameNode = FocusNode();

  final TextEditingController classCtr = TextEditingController();

  final TextEditingController emailCtr = TextEditingController();

  final FocusNode emailNode = FocusNode();

  final TextEditingController phoneCtr = TextEditingController();

  final FocusNode phoneNode = FocusNode();

  UpdateProfileRequest updateProfileRequest = UpdateProfileRequest();

  void updateInfo();
}
