import 'dart:io';

import 'package:emotion_tracker/core/src_core.dart';
import 'package:emotion_tracker/feature/src_feature.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

class AvatarComponent extends GetView<ProfileEditController> {
  const AvatarComponent({super.key});

  // double get avatarSize => Get.width / 2;

  // double get heightComponent => Get.width * 3 / 5;

  String get urlImage => controller.userInfoResponse.value.avatar != null
      ? controller.userInfoResponse.value.avatar.toUrlCDN()
      : ImageAsset.emptyAccount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(
          () => SimpleButton(
            onPressed: () {
              Get.bottomSheet(
                _buildOptionsPicker(),
                backgroundColor: context.backGroundCardColor,
                isScrollControlled: false,
              );
            },
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(AppDimens.paddingSmall),
                  height: 175,
                  width: 175,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: _buildImageExist(),
                  ),
                ),
                Positioned(
                  right: 20,
                  bottom: 20,
                  child: Container(
                    padding: const EdgeInsets.all(AppDimens.paddingVerySmall),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    alignment: Alignment.bottomRight,
                    child: const Icon(
                      Iconsax.camera,
                      color: Colors.black,
                      size: AppDimens.sizeIconMedium,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        UtilWidget.sizedBoxPadding,
        Obx(
          () => TextBuild(
            title: controller.userInfoResponse.value.fullName ?? "",
            fontSize: AppDimens.sizeTextLarge,
            isBoldText: true,
            textColor: Colors.white,
          ),
        ),
        Obx(
          () => TextBuild(
            title: controller.userInfoResponse.value.fullName ?? "",
            fontSize: AppDimens.sizeTextSmall,
            textColor: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildImageExist() {
    return _buildCircleBorder(
      () => NetworkImageWidget(
        widgetImageBuilder: (context, imageProvider) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
        urlImage: controller.userInfoResponse.value.avatar != null
            ? controller.userInfoResponse.value.avatar.toUrlCDN()
            : ImageAsset.emptyAccount,
      ),
    );
  }

  Widget _buildCircleBorder(WidgetCallback child) {
    return Container(
      padding: const EdgeInsets.all(AppDimens.paddingVerySmall),
      color: Colors.white,
      child: child(),
    );
  }

  Widget _buildOptionsPicker() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        UtilWidget.sizedBox10,
        Container(
          height: 5,
          width: 50,
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(AppDimens.radius20)),
        ),
        UtilWidget.sizedBox10,
        ListTileWidget(
          onTap: () => controller.pickImage(ImageSource.camera),
          title: ProfileEditStr.chooseFromCamera,
          iconLeading: Iconsax.camera,
          fontSizeTitle: AppDimens.sizeTextMedium,
          sizeIcon: 24,
        ),
        ListTileWidget(
          onTap: () => controller.pickImage(ImageSource.gallery),
          title: ProfileEditStr.chooseFromGallery,
          iconLeading: Iconsax.gallery,
          fontSizeTitle: AppDimens.sizeTextMedium,
          sizeIcon: 24,
        ),
        ListTileWidget(
          onTap: () {
            Get.close(1);
          },
          title: ProfileEditStr.deleteAvatar,
          iconLeading: Iconsax.trash,
          fontSizeTitle: AppDimens.sizeTextMedium,
          sizeIcon: 24,
        ),
        ListTileWidget(
          onTap: () => Get.back(),
          title: AppStr.close,
          iconLeading: Iconsax.close_square,
          fontSizeTitle: AppDimens.sizeTextMedium,
          sizeIcon: 24,
        ),
        UtilWidget.sizedBox10,
      ],
    );
  }
}
