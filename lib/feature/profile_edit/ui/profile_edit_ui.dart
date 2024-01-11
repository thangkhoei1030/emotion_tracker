import 'dart:io';
import 'package:get/get.dart';
import 'package:emotion_tracker/core/src_core.dart';
import 'package:flutter/material.dart';
import 'package:emotion_tracker/feature/src_feature.dart';

class ProfileEditPage extends BaseGetWidget<ProfileEditController> {
  const ProfileEditPage({super.key});
  @override
  ProfileEditController get controller => Get.put(ProfileEditControllerImp());
  @override
  Widget buildWidgets(BuildContext context) {
    return LoadingOverlayWidget(
      child: PageScaffold(
        showAppBar: false,
        showBackButton: true,
        title: const TextBuild(
          title: ProfileEditStr.title,
        ),
        child: Stack(
          children: [
            Image.asset(ImageAsset.profileAppBar),
            CustomPaint(
              painter: BackgroundProfileEditPainter(),
            ),
            Column(
              children: [
                Expanded(
                  child: CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      SliverAppBar(
                        centerTitle: true,
                        pinned: true,
                        automaticallyImplyLeading: false,
                        toolbarHeight: 75,
                        flexibleSpace: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CardBuilder(
                                  width: 50,
                                  height: 50,
                                  radiusModel: const RadiusModel(
                                      radiusAll: AppDimens.radius8),
                                  onTap: Get.back,
                                  elevation: 8,
                                  paddingModel: const PaddingModel(
                                      paddingAll: AppDimens.paddingSmall),
                                  backgroundColor:
                                      Colors.white.withOpacity(0.4),
                                  child: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                ),
                                const TextBuild(
                                  title: EmotionStatisticalStr.title,
                                  textColor: Colors.white,
                                ),
                                const SizedBox(
                                  width: 50,
                                )
                              ],
                            ).paddingSymmetric(
                                horizontal: AppDimens.paddingSmall),
                          ],
                        ),
                      ),
                      SliverList(
                          delegate: SliverChildListDelegate([
                        Column(
                          children: [
                            const AvatarComponent(),
                            UtilWidget.sizedBox30,
                            const ChangeInfoComponent(),
                            UtilWidget.sizedBox30,
                            const ChangePasswordComponent(),
                            UtilWidget.sizedBoxHeightSafeAreaBottom(context),
                          ],
                        ).paddingSymmetric(horizontal: AppDimens.defaultPadding)
                      ]))
                    ],
                  ),
                ),
                BaseButton(
                  function: () {},
                  titleButton: "titleButton",
                ).paddingSymmetric(
                  vertical: AppDimens.defaultPadding,
                ),
                UtilWidget.sizedBoxHeightSafeAreaBottom(context),
              ],
            ),
          ],
        ),
        // child: Column(
        //   children: [
        //     Expanded(
        //       child: SingleChildScrollView(
        //         child: Column(
        //           children: [
        //             const AvatarComponent(),
        //             UtilWidget.sizedBoxPaddingHuge,
        //             SimpleButton(
        //               onPressed: () => controller.isChangePassword.toggle(),
        //               child: const TextBuild(
        //                 isBoldText: true,
        //                 title: ProfileEditStr.changePassword,
        //               ),
        //             ),
        //             UtilWidget.sizedBoxPaddingHuge,
        //             Obx(
        //               () => controller.isChangePassword.value
        //                   ? const ChangePasswordComponent()
        //                   : const SizedBox.shrink(),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //     BaseButton(
        //       function: controller.saveChange,
        //       titleButton: ProfileEditStr.saveChange,
        //     ).paddingSymmetric(
        //       horizontal: AppDimens.defaultPadding,
        //       vertical: AppDimens.paddingSmall,
        //     ),
        //     SizedBox(
        //       height: MediaQuery.of(context).viewInsets.bottom,
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
