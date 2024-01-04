import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:emotion_tracker/core/src_core.dart';

class BuildImageLoadError extends StatelessWidget {
  const BuildImageLoadError({
    super.key,
    this.layout,
    this.isSlider = false,
    this.radiusModel = const RadiusModel(),
    this.heightImage,
    this.widthImage,
  });

  final ConfigLayout? layout;
  final bool isSlider;
  final RadiusModel radiusModel;
  final double? heightImage;
  final double? widthImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthImage ?? double.infinity,
      child: SvgPicture.asset(
        ImageAsset.empty,
        fit: BoxFit.cover,
        // height: heightImage ?? layout.imgHeight(isSlider: isSlider),
      ),
    );
  }
}
