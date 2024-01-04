import 'package:flutter/material.dart';
import 'package:emotion_tracker/core/src_core.dart';

class WidgetWithTile extends StatelessWidget {
  const WidgetWithTile({
    super.key,
    required this.titleLeading,
    required this.content,
    this.titleLeadingStyle,
    this.trailing,
    this.widgetPadding = const SizedBox.shrink(),
    this.colorTitle,
  });

  final String titleLeading;

  final TextStyle? titleLeadingStyle;

  final Widget? trailing;

  final Widget content;

  final Widget widgetPadding;

  final Color? colorTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: TextBuild(
                title: titleLeading,
                style: titleLeadingStyle,
                isBoldText: true,
                maxLines: 1,
                textColor: colorTitle,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (trailing != null) ...[
              trailing!,
            ],
          ],
        ),
        widgetPadding,
        content,
      ],
    );
  }
}
