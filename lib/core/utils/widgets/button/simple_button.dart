import 'package:flutter/material.dart';

class SimpleButton extends StatelessWidget {
  const SimpleButton({super.key, required this.child, this.onPressed});

  final Widget child;

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: key,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: onPressed,
      borderRadius: BorderRadius.circular(50),
      child: child,
    );
  }
}
