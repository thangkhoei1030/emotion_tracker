import 'package:emotion_tracker/feature/src_feature.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:emotion_tracker/core/src_core.dart';
import 'package:get/get.dart';
// import 'package:web4s/pages/routes.dart';

class LoginPage extends BaseGetWidget<LoginController> {
  const LoginPage({super.key});
  @override
  LoginControllerImp get controller => Get.put(LoginControllerImp());
  @override
  Widget buildWidgets(BuildContext context) {
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    return PageScaffold( 
      showAppBar: false,
      child: Stack(
        fit: StackFit.expand,
        children: [
          AlignTransition(
            alignment: controller.positionAnimation,
            child: ScaleTransition(
              scale: controller.zoomAnimation,
              child: SizedBox(
                height: 200,
                child: FlareActor(
                  "assets/animation/Teddy.flr",
                  shouldClip: false,
                  alignment: Alignment.topCenter,
                  fit: BoxFit.contain,
                  controller: controller.teddyController,
                ),
              ),
            ),
          ).paddingOnly(bottom: MediaQuery.of(context).viewInsets.bottom),
          // .marginOnly(top: 150 - keyboardHeight / 100, bottom: keyboardHeight)
          Positioned.fill(
            child: FadeTransition(
              opacity: controller.opacityAnimation,
              child: CustomPaint(
                painter: CustomBackground(
                  keyboardHeight / 2,
                ),
              ),
            ),
          ),

          Positioned.fill(
            child: FadeTransition(
              opacity: controller.opacityAnimation,
              child: SlideTransition(
                position: controller.formPositionAnimation,
                child: const FormSignInWidget(),
              ),
            ),
          )
        ],
      ).paddingOnly(bottom: MediaQuery.of(context).viewInsets.bottom),
    );
  }
}
