import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:emotion_tracker/core/src_core.dart';

class BuildInputTextWithLabel extends StatelessWidget {
  final InputTextModel inputTextModel;
  final String label;
  final String? labelRequired;
  final TextStyle? textStyle;
  final double? padding;
  final EdgeInsetsGeometry? paddingText;

  const BuildInputTextWithLabel({
    Key? key,
    required this.label,
    required this.inputTextModel,
    this.labelRequired,
    this.textStyle,
    this.padding,
    this.paddingText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding ?? 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: paddingText ?? EdgeInsets.zero,
            child: Row(
              children: [
                Flexible(
                  child: AutoSizeText(
                    label,
                    style: (textStyle ?? Get.textTheme.bodyText2)!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                AutoSizeText(
                  labelRequired ?? "",
                  style: Get.textTheme.bodyText1?.copyWith(
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          UtilWidget.sizedBox5,
          BuildInputText(inputTextModel),
        ],
      ),
    );
  }
}
