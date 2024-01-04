import 'package:flutter/material.dart';
import 'package:emotion_tracker/core/src_core.dart';

class InputTextModel {
  IconData? iconLeading;

  String? hintText;

  TextEditingController controller;

  FocusNode? currentNode;

  FocusNode? nextNode;

  bool obscureText;

  double borderRadius;

  TextInputAction iconNextTextInputAction;

  ValueChanged<String>? submitFunc;

  ValueChanged<String>? onNext;

  FormFieldValidator<String>? validator;

  int inputFormatters;

  TextInputType textInputType;

  /// The [lengthLimit] must be null, -1 or greater than zero. If it is null or -1
  /// then no limit is enforced.
  int? maxLengthInputForm;

  bool isReadOnly;

  bool autoFocus;

  Color? fillColor;

  Color? textColor;

  Color? hintTextColor;

  double? hintTextSize;

  double? textSize;

  Color? prefixIconColor;

  Color? errorTextColor;

  Color? suffixColor;

  ValueChanged<String>? onChanged;

  int? maxLines;

  Widget? suffixIcon;

  TextAlign? textAlign;

  bool isShowCounterText;

  bool enable;

  String? labelText;

  VoidCallback? onTap;

  EdgeInsetsGeometry? contentPadding;

  String? helperText;

  TextStyle? helperStyle;

  int? helperMaxLines;

  TextStyle? style;

  InputBorder? border;

  bool filled;

  bool? showCursor;

  bool showIconClear;

  Widget? prefixIcon;

  InputTextModel({
    this.iconLeading,
    this.hintText,
    required this.controller,
    this.currentNode,
    this.submitFunc,
    this.nextNode,
    this.obscureText = false,
    this.iconNextTextInputAction = TextInputAction.next,
    this.onNext,
    this.validator,
    this.inputFormatters = InputFormatterEnum.lengthLimitingText,
    this.borderRadius = 10.0,
    this.textInputType = TextInputType.text,
    this.maxLengthInputForm,
    this.isReadOnly = false,
    this.autoFocus = false,
    this.fillColor,
    this.textColor,
    this.hintTextColor,
    this.hintTextSize,
    this.textSize,
    this.prefixIconColor,
    this.errorTextColor,
    this.suffixColor,
    this.onChanged,
    this.maxLines = 1,
    this.suffixIcon,
    this.isShowCounterText = true,
    this.textAlign,
    this.enable = true,
    this.contentPadding,
    this.labelText,
    this.onTap,
    this.helperText,
    this.helperStyle,
    this.helperMaxLines,
    this.style,
    this.border,
    this.filled = true,
    this.showCursor,
    this.showIconClear = true,
    this.prefixIcon,
  });
}
