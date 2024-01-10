import 'package:flutter/material.dart';
import 'package:emotion_tracker/core/src_core.dart';

class BuildTextRow extends StatelessWidget {
  const BuildTextRow({
    super.key,
    required this.textLeading,
    required this.textTrailing,
    this.textColor,
    this.textSize,
  });

  final String textLeading;

  final String textTrailing;

  final Color? textColor;

  final double? textSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextBuild(
          title: textLeading,
          fontSize: textSize ?? AppDimens.sizeTextSmall,
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: TextBuild(
              fontSize: textSize,
              title: textTrailing,
              isBoldText: true,
              overflow: TextOverflow.fade,
              textColor: textColor,
            ),
          ),
        ),
      ],
    );
  }
}
