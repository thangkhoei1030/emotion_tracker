import 'package:get/get.dart';
import 'package:emotion_tracker/core/src_core.dart';
import 'package:flutter/material.dart';
import 'package:emotion_tracker/feature/src_feature.dart';
import 'package:iconsax/iconsax.dart';

class ChangeInfoAccountPage extends BaseGetWidget<ChangeInfoAccountController> {
  const ChangeInfoAccountPage({super.key});
  @override
  ChangeInfoAccountController get controller =>
      Get.put(ChangeInfoAccountControllerImp());
  @override
  Widget buildWidgets(BuildContext context) {
    return PageScaffold(
      showAppBar: false,
      child: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  centerTitle: true,
                  pinned: true,
                  automaticallyImplyLeading: false,
                  toolbarHeight: 75,
                  flexibleSpace: Row(
                    children: [
                      CardBuilder(
                        width: 40,
                        height: 40,
                        radiusModel:
                            const RadiusModel(radiusAll: AppDimens.radius8),
                        onTap: Get.back,
                        backgroundColor: HexColor.fromHex("#A0A0A0"),
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.black,
                        ),
                      ),
                      const Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: TextBuild(
                            title: ChangeInfoAccountStr.accountInfo,
                            textColor: Colors.black,
                            isBoldText: true,
                          ),
                        ),
                      ),
                    ],
                  ).paddingSymmetric(horizontal: AppDimens.paddingSmall),
                ),
                SliverList(
                    delegate: SliverChildListDelegate([
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UtilWidget.sizedBox30,
                      const FormComponentChangeInfoAccount(),
                      UtilWidget.sizedBoxPaddingHuge,
                      UtilWidget.sizedBoxPaddingHuge,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Iconsax.shield_tick,
                            size: AppDimens.sizeIconMedium,
                            color: HexColor.fromHex("#4ECD90"),
                          ),
                          const TextBuild(title: ChangeInfoAccountStr.security)
                        ],
                      ),
                      UtilWidget.sizedBox30,
                    ],
                  ).paddingSymmetric(horizontal: AppDimens.defaultPadding)
                ]))
              ],
            ),
          ),
          BaseButton(
            function: () {},
            backgroundColor: HexColor.fromHex("#2C44BB"),
            titleButton: ChangeInfoAccountStr.update,
            colorText: Colors.white,
          ),
          UtilWidget.sizedBox30,
        ],
      ),
    );
  }
}
