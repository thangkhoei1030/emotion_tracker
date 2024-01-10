import 'package:emotion_tracker/core/src_core.dart';
import 'package:emotion_tracker/feature/src_feature.dart';
import 'package:flutter/material.dart';

class BuildTitleChangePassword extends StatelessWidget {
  const BuildTitleChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 83,
          height: 83,
          decoration: BoxDecoration(
              color: HexColor.fromHex("#E7F0FF"),
              borderRadius: BorderRadius.circular(100)),
          child: Image.asset(
            ImageAsset.passwordCheck,
            color: HexColor.fromHex("#587CE1"),
          ),
        ),
        UtilWidget.sizedBoxPaddingHuge,
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimens.paddingSmall),
          child: TextBuild(
            isAutoSizeText: true,
            title: ChangePasswordStr.note,
            textAlign: TextAlign.center,
            fontSize: AppDimens.sizeTextDefault,
          ),
        )
      ],
    );
  }
}
