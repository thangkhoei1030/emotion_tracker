import 'package:emotion_tracker/feature/src_feature.dart';
import 'package:flutter/material.dart';
import 'package:emotion_tracker/core/src_core.dart';

abstract class ForgotPasswordController extends BaseGetxController {
  late final ForgotPasswordRepository repository;

  final TextEditingController emailController = TextEditingController();

  // ForgotPassword forgotPassRequest = ForgotPassword();
}
