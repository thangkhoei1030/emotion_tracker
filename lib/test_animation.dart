import 'package:emotion_tracker/core/utils/src_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

typedef WidgetAnimationCallBack = Widget Function(AnimationController);

class TestAnimationClass extends StatefulWidget {
  const TestAnimationClass({
    super.key,
    required this.isLoading,
    required this.widgetAnimationCallBack,
    this.animationDialogType = AnimationDialogType.loading,
    this.titleLoading = "Description",
  });

  final bool isLoading;

  final WidgetAnimationCallBack widgetAnimationCallBack;

  final AnimationDialogType animationDialogType;

  final String titleLoading;

  @override
  State<TestAnimationClass> createState() => _TestAnimationClassState();
}

class _TestAnimationClassState extends State<TestAnimationClass>
    with TickerProviderStateMixin {
  late final AnimationController loadingAnimation;

  late final AnimationController showUserInterfaceAnimationController;

  late final Tween<double> opacityAnimation;

  late final Tween<Offset> offsetAnimation;

  bool nextAnimation = false;

  @override
  void initState() {
    super.initState();
    _initialAnimationController();
    _loadingAnimationListener();
    nextAnimation = widget.isLoading;
  }

  void _initialAnimationController() {
    opacityAnimation = Tween(begin: 0.0, end: 1.0);
    offsetAnimation = Tween(begin: const Offset(1, 0), end: const Offset(0, 0));
    loadingAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    showUserInterfaceAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  void _loadingAnimationListener() {
    loadingAnimation.addStatusListener((status) async {
      if (!widget.isLoading) {
        await loadingAnimation.reverse().then(
          (value) async {
            if (mounted) {
              setState(() {
                nextAnimation = true;
              });
            }
            loadingAnimation.stop();
            await showUserInterfaceAnimationController.forward();
          },
        );
      } else {
        loadingAnimation.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.isLoading
        ? AnimationLoading(
            animationDialogType: AnimationDialogType.quizLoading,
            description: "description",
            animationController: loadingAnimation,
          )
        : widget.widgetAnimationCallBack(
            showUserInterfaceAnimationController,
          );
  }
}
