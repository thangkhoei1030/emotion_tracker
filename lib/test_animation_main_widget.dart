import 'package:emotion_tracker/test_animation.dart';
import 'package:get/get.dart';
import 'package:emotion_tracker/core/src_core.dart';
import 'package:flutter/material.dart';
import 'package:emotion_tracker/feature/src_feature.dart';

class TestAnimationWidgetRepository extends BaseRepository {
  TestAnimationWidgetRepository(super.controller);
}

abstract class TestAnimationWidgetController extends BaseGetxController {
  late final Animation<double> opacityAnimation;

  late final Animation<Offset> offsetAnimation;
}

class TestAnimationWidgetControllerImp extends TestAnimationWidgetController {
  @override
  void onInit() async {
    super.onInit();
    try {
      showLoading();
      await Future.delayed(const Duration(seconds: 3));
    } finally {
      hideLoading();
    }
  }
}

class TestAnimationWidgetPage
    extends BaseGetWidget<TestAnimationWidgetController> {
  const TestAnimationWidgetPage({super.key});
  @override
  TestAnimationWidgetController get controller =>
      Get.put(TestAnimationWidgetControllerImp());
  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => TestAnimationClass(
          isLoading: controller.isShowLoading.value,
          widgetAnimationCallBack: (animationController) {
            final Animation<int> opacityAnimation =
                Tween<int>(begin: 0, end: 1).animate(
              CurvedAnimation(
                  parent: animationController, curve: Curves.fastOutSlowIn),
            );
            final Animation<Offset> offsetAnimation =
                Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0)).animate(
              CurvedAnimation(
                  parent: animationController, curve: Curves.fastOutSlowIn),
            );
            return Container(
              color: Colors.blue,
              width: Get.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const AnimationDialog(
                    width: 300,
                    height: 300,
                    animationDialogType: AnimationDialogType.errorOccurred,
                  ),
                  const TextBuild(
                    title: ErrorStr.cannotGetData,
                  ),
                  UtilWidget.sizedBoxPadding,
                  BaseButton(
                    backgroundColor: Colors.lightBlue,
                    width: Get.width * 2 / 3,
                    function: () {},
                    titleButton: AppStr.reload,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
