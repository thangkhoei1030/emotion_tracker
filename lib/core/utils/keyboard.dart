import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:emotion_tracker/core/src_core.dart';

class KeyBoard {
  static void hide() {
    //   FocusManager.instance.primaryFocus?.unfocus();
    Get.focusScope!.unfocus();
  }

  static bool keyboardIsVisible(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom > 0.0;
  }

  static Widget keyboardVisible(Widget child, {String? title}) {
    return StatefulBuilder(builder: (context, setState) {
      if (MediaQuery.of(context).viewInsets.bottom == 0) {
        return child;
      }
      return title != null
          ? UtilWidget.baseOnAction(
              onTap: () {
                hide();
              },
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: AutoSizeText(
                        title,
                        style: Get.textTheme.bodySmall,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_hide_outlined,
                    size: AppDimens.sizeIconMedium,
                  )
                ],
              ))
          : const SizedBox();
    });
  }
}

bool keyboardIsVisible(double window) {
  return window > 0.0;
}
