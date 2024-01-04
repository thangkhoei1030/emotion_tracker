import 'package:emotion_tracker/core/src_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingAnimationLottie extends StatefulWidget {
  const LoadingAnimationLottie({
    super.key,
    required this.animationDialogType,
    required this.description,
  });

  final AnimationDialogType animationDialogType;

  final String description;

  @override
  State<LoadingAnimationLottie> createState() => _LoadingAnimationLottieState();
}

class _LoadingAnimationLottieState extends State<LoadingAnimationLottie>
    with TickerProviderStateMixin {
  late final AnimationController animationController;

  late final Animation<double> opacityAnimation;

  late final Animation<Offset> offsetAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
      animationController,
    );
    offsetAnimation =
        Tween(begin: const Offset(1, 0), end: const Offset(0, 0)).animate(
      CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn),
    );

    animationController.forward();

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.stop();
      }
    });
  }

  @override
  void didUpdateWidget(covariant LoadingAnimationLottie oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: opacityAnimation,
      child: Container(
        width: Get.width,
        color: HSLColor.fromColor(Colors.blue).withLightness(0.7).toColor(),
        child: FadeTransition(
          opacity: opacityAnimation,
          child: SlideTransition(
            position: offsetAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimationDialog(
                  animationDialogType: widget.animationDialogType,
                  height: 300,
                ),
                UtilWidget.sizedBoxPaddingHuge,
                TextBuild(
                  title: widget.description,
                  isBoldText: true,
                ),
                UtilWidget.sizedBoxPaddingHuge,
                UtilWidget.sizedBoxPaddingHuge,
                UtilWidget.sizedBoxPaddingHuge,
                UtilWidget.sizedBoxPaddingHuge,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
