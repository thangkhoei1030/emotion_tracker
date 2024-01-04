import 'package:flutter/material.dart';

import 'package:emotion_tracker/core/src_core.dart';

class ValidateFormWidget extends StatelessWidget {
  static const String errorMessageDefault = "Giá trị không được để trống";

  const ValidateFormWidget({
    Key? key,
    this.errorMessage = errorMessageDefault,
    required this.validateFunc,
    required this.child,
  }) : super(key: key);

  final String errorMessage;

  final bool Function() validateFunc;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        child,
        UtilWidget.sizedBox10,
        if (!validateFunc())
          TextBuild(
            title: errorMessage,
            textColor: Colors.red,
            fontSize: AppDimens.sizeTextSmall,
          )
      ],
    );
  }
}
