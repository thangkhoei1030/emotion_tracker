import 'package:flutter/material.dart';
import 'package:emotion_tracker/core/src_core.dart';

class RatioWidget extends StatelessWidget {
  const RatioWidget({super.key, required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      padding: const EdgeInsets.all(AppDimens.paddingSmallest),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: context.radioSelectedColor(isSelected)),
      ),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Container(
          height: 15,
          width: 15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: context.radioSelectedColor(isSelected),
            // isSelected ? AppColors.appColor : AppColors.cardBackGroundColor,
          ),
        ),
      ),
    );
  }
}
