import 'package:emotion_tracker/feature/src_feature.dart';

import 'package:flutter/material.dart';
import 'package:emotion_tracker/core/src_core.dart';
import 'package:get/get.dart';

class LoginPage extends BaseGetWidget<LoginController> {
  const LoginPage({super.key});
  @override
  LoginControllerImp get controller => Get.put(LoginControllerImp());
  @override
  Widget buildWidgets(BuildContext context) {
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    return PageScaffold(
      resizeToAvoidBottomInset: false,
      showAppBar: false,
      child: Stack(
        children: [
          AnimatedBuilder(
            animation: controller.stackPositionedIcon,
            builder: (context, child) => Positioned.fill(
              top: controller.stackPositionedIcon.value -
                  MediaQuery.of(context).viewInsets.bottom / 3 +
                  MediaQuery.of(context).padding.top,
              right: 0,
              left: 0,
              child: AlignTransition(
                alignment: controller.positionAnimation,
                child: AnimatedBuilder(
                  animation: controller.sizeTransition,
                  builder: (BuildContext context, Widget? child) {
                    return Container(
                      height: controller.sizeTransition.value.dy,
                      width: controller.sizeTransition.value.dx,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(ImageAsset.appImages),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: SlideTransition(
              position: controller.formPositionAnimation,
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
