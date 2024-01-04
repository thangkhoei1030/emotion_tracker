import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:emotion_tracker/core/src_core.dart';

class TextBuild extends StatelessWidget {
  const TextBuild({
    super.key,
    required this.title,
    this.fontSize,
    this.decoration,
    this.style,
    this.textColor,
    this.maxLines,
    this.textAlign = TextAlign.center,
    this.overflow,
    this.isBoldText = false,
    this.isAutoSizeText = false,
    this.fontStyle = FontStyle.normal,
    this.function,
  });
  final String title;
  final TextStyle? style;
  final TextDecoration? decoration;
  final Color? textColor;
  final double? fontSize;
  final int? maxLines;
  final TextAlign textAlign;
  final TextOverflow? overflow;
  final bool isBoldText;
  final bool isAutoSizeText;
  final Function()? function;
  final FontStyle fontStyle;
  @override
  Widget build(BuildContext context) {
    return SimpleButton(
      onPressed: function,
      child: isAutoSizeText
          ? AutoSizeText(
              title,
              style: style ??
                  Theme.of(context).textTheme.bodyText1!.copyWith(
                        decoration: decoration,
                        color: textColor,
                        fontSize: fontSize ?? AppDimens.sizeTextDefault,
                        fontWeight: isBoldText ? FontWeight.bold : null,
                      ),
              overflow: overflow,
              maxLines: maxLines,
              textAlign: textAlign,
            )
          : Text(
              title,
              style: style ??
                  Theme.of(context).textTheme.bodyText1!.copyWith(
                        decoration: decoration,
                        color: textColor,
                        fontSize: fontSize ?? AppDimens.sizeTextDefault,
                        fontWeight: isBoldText ? FontWeight.bold : null,
                      ),
              overflow: overflow,
              maxLines: maxLines,
              textAlign: textAlign,
            ),
    );
  }
}


