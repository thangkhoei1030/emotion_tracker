import 'package:emotion_tracker/core/src_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AppController(), permanent: true);
    return Container();
  }
}
