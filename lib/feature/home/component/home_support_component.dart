import 'package:emotion_tracker/core/src_core.dart';
import 'package:flutter/material.dart';

class HomeSupportComponent extends StatelessWidget {
  const HomeSupportComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ItemHomeSupportComponent(
            backgroundColor: HexColor.fromHex('e3ae00'),
            animationDialogType: AnimationDialogType.gift,
            text: "Đổi quà tặng",
          ),
        ),
        UtilWidget.sizedBoxWidthPadding,
        Expanded(
          child: ItemHomeSupportComponent(
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
      required this.animationDialogType,
      required this.text,
      this.backgroundColor});

  final AnimationDialogType animationDialogType;

  final String text;

  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return CardBuilder(
      elevation: 6,
      radiusModel: const RadiusModel(radiusAll: AppDimens.radius20),
      backgroundColor: backgroundColor,
      paddingModel: const PaddingModel(
        paddingVerical: AppDimens.defaultPadding,
        paddingHorizontal: AppDimens.paddingSmall,
      ),
      child: Column(
        children: [
          AnimationDialog(
            animationDialogType: animationDialogType,
            height: 150,
          ),
          UtilWidget.sizedBoxPadding,
          TextBuild(
            title: text,
            textColor: Colors.white,
          )
        ],
      ),
    );
  }
}
