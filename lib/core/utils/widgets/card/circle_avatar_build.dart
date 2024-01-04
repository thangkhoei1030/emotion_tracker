import 'package:flutter/material.dart';

class CircleAvatarBuilder extends StatelessWidget {
  const CircleAvatarBuilder({
    super.key,
    this.backgroundColor,
    this.assetName,
    this.size,
    this.child,
  });

  final Color? backgroundColor;
  final double? size;
  final String? assetName;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size ?? 50,
      width: size ?? 50,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(100),
        image: assetName != null
            ? DecorationImage(image: AssetImage(assetName!))
            : null,
      ),
      child: child,
    );
  }
}
