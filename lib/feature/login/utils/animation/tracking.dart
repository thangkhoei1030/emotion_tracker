import 'dart:async';

import 'package:flutter/material.dart';
import 'package:emotion_tracker/core/src_core.dart';
import 'input_render.dart';

typedef CaretMoved = void Function(Offset? globalCaretPosition);
typedef TextChanged = void Function(String text);

// Helper widget to track caret position.
class TrackingTextInput extends StatefulWidget {
  const TrackingTextInput({
    Key? key,
    this.onCaretMoved,
    required this.inputTextModel,
    required this.label,
  }) : super(key: key);
  final CaretMoved? onCaretMoved;

  final InputTextModel inputTextModel;

  final String label;

  @override
  State<TrackingTextInput> createState() => _TrackingTextInputState();
}

class _TrackingTextInputState extends State<TrackingTextInput> {
  final GlobalKey _fieldKey = GlobalKey();
  Timer? _debounceTimer;
  @override
  initState() {
    widget.inputTextModel.controller.addListener(() {
      // We debounce the listener as sometimes the caret position is updated after the listener
      // this assures us we get an accurate caret position.
      if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();
      _debounceTimer = Timer(const Duration(milliseconds: 100), () {
        if (_fieldKey.currentContext != null) {
          // Find the render editable in the field.
          final RenderObject? fieldBox =
              _fieldKey.currentContext?.findRenderObject();
          var caretPosition =
              fieldBox is RenderBox ? getCaretPosition(fieldBox) : null;

          widget.onCaretMoved?.call(caretPosition);
        }
      });
      widget.inputTextModel.onChanged
          ?.call(widget.inputTextModel.controller.text);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: BuildInputTextWithLabel(
        inputTextModel: widget.inputTextModel,
        label: widget.label,
        key: _fieldKey,
        // label: widget.title,
        // inputTextModel: widget.inputTextModel,
      ),
    );
  }
}
