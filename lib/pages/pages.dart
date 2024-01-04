import 'package:animations/animations.dart';
import 'package:emotion_tracker/feature/src_feature.dart';
import 'package:emotion_tracker/pages/src_pages.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageRoutes {
  static Future<void> navigator<T>({
    required Widget page,
    Function(T?)? functionResult,
    bool preventDuplicates = true,
    dynamic arguments,
  }) async {
    Get.to<T?>(
      () => page,
      arguments: arguments,
      preventDuplicates: preventDuplicates,
      //transition: Transition.circularReveal,
    )?.then((value) => functionResult?.call(value));
  }

  static void backMultiScreen(String routeBack) async {
    Get.until((route) => Get.currentRoute == routeBack);
  }

  static List<GetPage> pageRoutes = [
    GetPage(
      name: AppRoutes.splashPage,
      page: () => const SplashPage(),
      //transition: Transition.circularReveal,
    ),
    GetPage(
      name: AppRoutes.loginPage,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: AppRoutes.homePage,
      page: () => const HomePage(),
    ),
    GetPage(
      name: AppRoutes.emotionTrackerPage,
      page: () => const EmotionTrackerPage(),
    ),
    GetPage(
      name: AppRoutes.emotionStatisticalPage,
      page: () => const EmotionStatisticalPage(),
    ),
    GetPage(
      name: AppRoutes.quizOverview,
      page: () => const QuizOverviewPage(),
      binding: QuizOverviewControllerBindings(),
    ),
    GetPage(
      name: AppRoutes.congratulationQuiz,
      page: () => const CongratulationsPage(),
    ),
  ];
}

class PageTransitionSwitcher extends CustomTransition {
  @override
  Widget buildTransition(
    BuildContext context,
    Curve? curve,
    Alignment? alignment,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeThroughTransition(
      animation: animation,
      secondaryAnimation: secondaryAnimation,
      fillColor: Theme.of(context).colorScheme.surface,
      child: child,
    );
  }
}
