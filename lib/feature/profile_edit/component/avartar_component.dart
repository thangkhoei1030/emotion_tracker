import 'dart:io';

import 'package:emotion_tracker/core/src_core.dart';
import 'package:emotion_tracker/feature/src_feature.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

class AvatarComponent extends GetView<ProfileEditController> {
  const AvatarComponent({super.key});

  double get avatarSize => Get.width / 2;

  double get heightComponent => Get.width * 3 / 5;

  String get urlImage => controller.userInfoResponse.value.avatar != null
      ? controller.userInfoResponse.value.avatar.toUrlCDN()
      : ImageAsset.emptyAccount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: heightComponent,
          child: Stack(
            children: [
              CustomPaint(
                size: Size.infinite,
                painter: CustomAvatar(
                  color: context.primaryColor,
                  avatarRadius: avatarSize / 2,
                ),
              ),
              Positioned(
                left: avatarSize / 2,
                top: heightComponent - avatarSize,
                child: SimpleButton(
                  onPressed: () {
                    Get.bottomSheet(
                      _buildOptionsPicker(),
                      backgroundColor: context.backGroundCardColor,
                      isScrollControlled: false,
                    );
                  },
                  child: Obx(
                    () => SizedBox(
                      height: avatarSize,
                      width: avatarSize,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: controller.image.value != null
                            ? Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: FileImage(
                                      File(controller.image.value?.path ?? ""),
                                    ),
                                  ),
                                ),
                              )
                            : NetworkImageWidget(
                                widgetImageBuilder: (context, imageProvider) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                },
                                urlImage: urlImage,
                              ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        UtilWidget.sizedBoxPadding,
        Obx(
          () => TextBuild(
            title: controller.userInfoResponse.value.fullName ?? "",
            fontSize: AppDimens.sizeTextMedium,
            isBoldText: true,
          ),
        ),
      ],
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
            controller.image.value = null;
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
