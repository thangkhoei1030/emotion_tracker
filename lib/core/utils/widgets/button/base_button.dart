import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:emotion_tracker/core/src_core.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    super.key,
    required this.function,
    required this.titleButton,
    this.width,
    this.height,
    this.radiusButton,
    this.isLoading = false,
    this.fontSize,
    this.colorText,
    this.isShowLoading = false,
    this.backgroundColor,
    this.iconLeading,
    this.iconColor,
    this.elevation,
    this.colorLoading,
  });
  final double? width;
  final double? height;
  final double? radiusButton;
  final VoidCallback function;
  final bool isLoading;
  final String titleButton;
  final double? fontSize;
  final Color? colorText;
  final bool isShowLoading;
  final Color? backgroundColor;
  final IconData? iconLeading;
  final Color? iconColor;
  final double? elevation;
  final Color? colorLoading;
  @override
  Widget build(BuildContext context) {
    return CardBuilder(
      backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.primary,
      paddingModel: const PaddingModel(paddingAll: AppDimens.paddingSmall),
      width: width ?? Get.width * 2 / 3,
      height: height,
      radiusModel: RadiusModel(radiusAll: radiusButton ?? AppDimens.radius8),
      child: SimpleButton(
        onPressed: () {
          FunctionUtils.runFunction(() {
            function();
          });
        },
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Visibility(
                visible: iconLeading != null,
                child: Icon(
                  iconLeading,
                  color: iconColor,
                ),
              ),
              TextBuild(
                title: titleButton,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: fontSize ?? AppDimens.fontMedium(),
                      color: colorText,
                    ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Visibility(
                visible: isLoading && isShowLoading,
                child: CupertinoActivityIndicator(
                  color: colorLoading,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
