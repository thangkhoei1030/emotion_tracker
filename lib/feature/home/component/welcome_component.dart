import 'package:emotion_tracker/core/src_core.dart';
import 'package:emotion_tracker/pages/src_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeComponent extends StatelessWidget {
  const WelcomeComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TextBuild(
                title: 'Hi ThangNQ',
                isBoldText: true,
              ),
              SimpleButton(
                onPressed: () {
                  APP_DATA.delete(AppConst.keyUserName);
                  APP_DATA.delete(AppConst.keyUserpassword);
                  Get.offAllNamed(AppRoutes.loginPage);
                },
                child: const CircleAvatarBuilder(
                  backgroundColor: Colors.red,
                ),
              )
            ],
          ),
        ),
        UtilWidget.sizedBoxPaddingHuge,
        const TextBuild(
          title: "Chào bạn!\nChúc một ngày mới tốt lành",
          isBoldText: true,
          textAlign: TextAlign.start,
          fontSize: AppDimens.sizeTextMedium,
        )
      ],
    );
  }
}
