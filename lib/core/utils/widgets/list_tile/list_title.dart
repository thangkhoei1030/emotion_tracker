import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:emotion_tracker/core/src_core.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
    this.iconLeading,
    this.onTap,
    this.title,
    this.titleColor,
    this.subtitle,
    this.subtitleColors,
    this.textColor,
    this.trailing,
    this.iconColorLeading,
    this.iconColorsTrailing,
    this.iconColors,
    this.imgIconLeading,
    this.imgIconTrailing,
    this.fontSizeTitle,
    this.fontSizeSubtitle,
    this.sizeIcon = AppDimens.iconListTileSizeDefaut,
    this.iconTrailing,
  });
  final IconData? iconLeading;
  final IconData? iconTrailing;
  final VoidCallback? onTap;
  final String? title;
  final Color? titleColor;
  final String? subtitle;
  final Color? subtitleColors;
  final Color? textColor;
  final IconData? trailing;
  final Color? iconColorLeading;
  final Color? iconColorsTrailing;
  final Color? iconColors;
  final String? imgIconLeading;
  final String? imgIconTrailing;
  final double? fontSizeTitle;
  final double? fontSizeSubtitle;
  final double sizeIcon;

  @override
  Widget build(BuildContext context) {
    return SimpleButton(
      onPressed: () {
        onTap?.call();
      },
      child: IntrinsicHeight(
        child: Row(
          children: [
            if (imgIconLeading != null) ...[
              BuildIcon.image(
                urlImage: imgIconLeading,
                size: sizeIcon,
              ),
              UtilWidget.sizedBoxWidthPadding,
            ] else if (iconLeading != null) ...[
              BuildIcon.iconData(
                iconData: iconLeading,
                iconColor: iconColorLeading,
                size: sizeIcon,
              ),
              UtilWidget.sizedBoxWidthPadding,
            ],
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null)
                    TextBuild(
                      title: title ?? "",
                      textColor: titleColor,
                      fontSize: fontSizeTitle ?? AppDimens.sizeTextSmall,
                    ),
                  if (subtitle != null)
                    TextBuild(
                      title: subtitle ?? "",
                      textColor: subtitleColors,
                      fontSize: fontSizeSubtitle ?? AppDimens.sizeTextSmall,
                    ),
                ],
              ),
            ),
            if (imgIconTrailing != null)
              BuildIcon.image(
                urlImage: imgIconTrailing,
                size: sizeIcon,
              )
            else
              BuildIcon.iconData(
                iconData: iconTrailing,
                iconColor: iconColorsTrailing,
                size: sizeIcon,
              )
          ],
        ).paddingSymmetric(
            vertical: AppDimens.paddingSmall,
            horizontal: AppDimens.defaultPadding),
      ),
    );
  }
}

class BuildIcon extends StatelessWidget {
  const BuildIcon.image({super.key, this.urlImage, this.size})
      : iconData = null,
        iconColor = null;

  const BuildIcon.iconData(
      {super.key, this.iconData, this.iconColor, this.size})
      : urlImage = null;

  final String? urlImage;

  final IconData? iconData;

  final Color? iconColor;

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: size,
      width: size,
      child: urlImage != null
          ? NetworkImageWidget(
              urlImage: urlImage!,
              heightImage: size,
              widthImage: size,
            )
          : Icon(
              iconData,
              color: iconColor,
              size: size,
            ),
    );
  }
}
