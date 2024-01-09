import 'package:emotion_tracker/feature/src_feature.dart';
import 'package:flutter/material.dart';

mixin AnimationLogin on LoginController {
  late final AnimationController animationController;

  late final Animation<Offset> sizeTransition;

  late final Animation<AlignmentGeometry> positionAnimation;

  late final Animation<double> opacityAnimation;

  late final AnimationController showUserInterfaceAnimationController;

  late final Animation<Offset> formPositionAnimation;

  late final Animation<double> stackPositionedIcon;

  void initialAnimation() {
    showUserInterfaceAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));

    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));

    sizeTransition = Tween<Offset>(
            begin: const Offset(206, 227), end: const Offset(162, 179))
        .animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    stackPositionedIcon = Tween<double>(begin: 0, end: 100).animate(
      CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn),
    );

    formPositionAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: showUserInterfaceAnimationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    positionAnimation = Tween<AlignmentGeometry>(
      begin: Alignment.center,
      end: Alignment.topCenter,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    opacityAnimation = Tween<double>(begin: 0, end: 1)
        .animate(showUserInterfaceAnimationController);
    _addListennerAnimation();
  }

  void _addListennerAnimation() {
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.stop();
      }
    });
    showUserInterfaceAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.stop();
      }
    });
  }

  Future<void> loadingAnimation() async {
    await Future.delayed(const Duration(seconds: 2));
    animationController.forward();
    showUserInterfaceAnimationController.forward();
  }

  void closeAnimation() {
    animationController.dispose();
    showUserInterfaceAnimationController.dispose();
  }
}
