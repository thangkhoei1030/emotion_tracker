import 'package:flutter/material.dart';
import 'package:emotion_tracker/core/src_core.dart';

class BuildTextRow extends StatelessWidget {
  const BuildTextRow({
    super.key,
    required this.textLeading,
    required this.textTrailing,
    this.textColor,
  });

  final String textLeading;

  final String textTrailing;

  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextBuild(
          title: textLeading,
          fontSize: AppDimens.sizeTextSmall,
        ),
        TextBuild(
          title: textTrailing,
          isBoldText: true,
          textColor: textColor,
        ),
      ],
    );
  }
}
