import 'package:emotion_tracker/feature/src_feature.dart';
import 'package:flutter/material.dart';
import 'package:emotion_tracker/core/src_core.dart';
import 'package:get/get.dart';

abstract class LoginController extends BaseGetxController
    with GetTickerProviderStateMixin {
  late final LoginRepository loginRepository;

  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TeddyController teddyController = TeddyController();

  LoginRequest loginRequest = LoginRequest();

  Future<void> funcLogin();
}
