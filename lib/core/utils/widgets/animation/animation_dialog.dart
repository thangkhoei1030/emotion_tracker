import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:emotion_tracker/core/src_core.dart';

enum AnimationDialogType {
  none,
  success,
  error,
  errorOccurred,
  warning,
  congratulation,
  sad,
  loading,
  favourite,
  graph,
  gift,
  support,
  graphStatistical,
  listenMusic,
  quizLoading,
  calculate,
  happy,
  happHome,
}

class AnimationDialog extends StatelessWidget {
  const AnimationDialog({
    super.key,
    this.animationDialogType = AnimationDialogType.none,
    this.height = 200,
    this.width,
    this.repeat = true,
  });

  final double? height;

  final double? width;

  final bool repeat;

  final AnimationDialogType animationDialogType;
  @override
  Widget build(BuildContext context) {
    late String assetAnimation;
    switch (animationDialogType) {
      case AnimationDialogType.congratulation:
        assetAnimation = AnimationAsset.congratulationAnimation;
        break;
      case AnimationDialogType.success:
        assetAnimation = AnimationAsset.verifyAnimation;
        break;
      case AnimationDialogType.error:
        assetAnimation = AnimationAsset.errorAnimation;
        break;
      case AnimationDialogType.sad:
        assetAnimation = AnimationAsset.sadAnimation;
        break;
      case AnimationDialogType.loading:
        assetAnimation = AnimationAsset.loadingAnimation;
        break;
      case AnimationDialogType.favourite:
        assetAnimation = AnimationAsset.heartAnimation;
        break;
      case AnimationDialogType.errorOccurred:
        assetAnimation = AnimationAsset.errorOccurred;
        break;
      case AnimationDialogType.graph:
        assetAnimation = AnimationAsset.graph;
        break;
      case AnimationDialogType.gift:
        assetAnimation = AnimationAsset.gift;
        break;
      case AnimationDialogType.support:
        assetAnimation = AnimationAsset.support;
        break;
      case AnimationDialogType.graphStatistical:
        assetAnimation = AnimationAsset.graphStatistical;
        break;
      case AnimationDialogType.listenMusic:
        assetAnimation = AnimationAsset.listenMusic;
        break;
      case AnimationDialogType.quizLoading:
        assetAnimation = AnimationAsset.getQuizLoading;
        break;
      case AnimationDialogType.calculate:
        assetAnimation = AnimationAsset.calculateAnimation;
        break;
      case AnimationDialogType.happy:
        assetAnimation = AnimationAsset.happyAnimation;
        break;
      case AnimationDialogType.happHome:
        assetAnimation = AnimationAsset.happyHomeAnimation;
        break;
      default:
        assetAnimation = "";
    }
    return Lottie.asset(
      assetAnimation,
      height: height,
      width: width,
      repeat: repeat,
      fit: BoxFit.fill,
      errorBuilder: (context, error, stackTrace) {
        return const SizedBox.shrink();
      },
      frameRate: FrameRate(60),
    );
  }
}
