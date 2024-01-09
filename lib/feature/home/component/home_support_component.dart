import 'package:emotion_tracker/core/src_core.dart';
import 'package:emotion_tracker/test_animation_main_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeSupportComponent extends StatelessWidget {
  const HomeSupportComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ItemHomeSupportComponent(
            assetImage: ImageAsset.giftImage,
            assetIcon: ImageAsset.giftIcon,
            backgroundColor: HexColor.fromHex('E3AE00'),
            animationDialogType: AnimationDialogType.gift,
            text: "Đổi quà tặng",
          ),
        ),
        UtilWidget.sizedBoxWidthPadding,
        Expanded(
          child: ItemHomeSupportComponent(
            assetImage: ImageAsset.supportImage,
            assetIcon: ImageAsset.supportIcon,
            backgroundColor: HexColor.fromHex('6a6dfa'),
            animationDialogType: AnimationDialogType.support,
            text: "Hỗ trợ tâm tý",
          ),
        ),
      ],
    );
  }
}

class ItemHomeSupportComponent extends StatelessWidget {
  const ItemHomeSupportComponent(
      {super.key,
      this.animationDialogType,
      required this.text,
      this.backgroundColor,
      required this.assetImage,
      required this.assetIcon});

  final AnimationDialogType? animationDialogType;

  final String assetIcon;

  final String assetImage;

  final String text;

  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return CardBuilder(
      onTap: () => Get.to(
        () => const TestAnimationWidgetPage(),
      ),
      elevation: 6,
      radiusModel: const RadiusModel(radiusAll: AppDimens.radius20),
      backgroundColor: backgroundColor,
      paddingModel: const PaddingModel(
        paddingVerical: AppDimens.defaultPadding,
        paddingHorizontal: AppDimens.paddingSmall,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.asset(assetImage),
          UtilWidget.sizedBoxPadding,
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(assetIcon),
                // AnimationDialog(
                //   animationDialogType: animationDialogType,
                //   height: 150,
                // ),
                UtilWidget.sizedBoxPadding,
                TextBuild(
                  title: text,
                  isBoldText: true,
                  textColor: Colors.white,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
