import 'package:flutter/material.dart';
import 'package:emotion_tracker/core/src_core.dart';

typedef DraggableOffsetCallBack = Function(Offset);

class FloatingButtonDraggable extends StatefulWidget {
  const FloatingButtonDraggable({
    super.key,
    required this.onPressed,
    required this.iconData,
    this.backgroundColor,
    this.isStack = false,
  });
  final VoidCallback onPressed;
  final IconData iconData;
  final Color? backgroundColor;
  final bool isStack;

  @override
  State<FloatingButtonDraggable> createState() =>
      _FloatingButtonDraggableState();
}

class _FloatingButtonDraggableState extends State<FloatingButtonDraggable> {
  Offset? offset;

  void draggableOffsetCallBack(Offset renderBoxOffset, Offset globalOffset) {
    setState(() {
      if (offset == null) {
        offset = Offset(globalOffset.dx, globalOffset.dy);
      } else {
        offset = offset! + renderBoxOffset;
      }
    });
  }

  double get defaultOffset =>
      AppDimens.defaultPadding +
      (widget.isStack
          ? kBottomNavigationBarHeight + AppDimens.paddingSmall
          : 0);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: offset?.dy,
      left: offset?.dx,
      bottom: offset == null ? defaultOffset : null,
      right: offset == null ? AppDimens.defaultPadding : null,
      child: Draggable(
        onDragEnd: (details) {
          RenderBox renderBox = context.findRenderObject() as RenderBox;
          draggableOffsetCallBack(
              renderBox.globalToLocal(details.offset), details.offset);
        },
        feedback: _buildFloatingButton(),
        childWhenDragging: const SizedBox(),
        child: _buildFloatingButton(),
      ),
    );
  }

  Widget _buildFloatingButton() {
    return FloatingActionButton(
      onPressed: widget.onPressed,
      backgroundColor: widget.backgroundColor,
      child: Icon(widget.iconData),
    );
  }
}
