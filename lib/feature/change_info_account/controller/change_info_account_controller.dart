
import 'package:emotion_tracker/core/src_core.dart';
import 'package:emotion_tracker/feature/src_feature.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ChangeInfoAccountController extends BaseGetxController {


  final HomeController homeController = Get.find();


  final TextEditingController fullNameCtr = TextEditingController();

  final FocusNode fullNameNode = FocusNode();

  final TextEditingController classCtr = TextEditingController();

  final TextEditingController emailCtr = TextEditingController();

  final FocusNode emailNode = FocusNode();

  final TextEditingController phoneCtr = TextEditingController();

  final FocusNode phoneNode = FocusNode();
}
