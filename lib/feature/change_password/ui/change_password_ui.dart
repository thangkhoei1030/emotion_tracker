import 'package:get/get.dart';
import 'package:emotion_tracker/core/src_core.dart';
import 'package:flutter/material.dart';
import 'package:emotion_tracker/feature/src_feature.dart';

class ChangePasswordPage extends BaseGetWidget<ChangePasswordController> {
  const ChangePasswordPage({super.key});

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
                            title: ChangePasswordStr.changePassword,
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
                    children: const [
                      UtilWidget.sizedBox30,
                      BuildTitleChangePassword(),
                      FormComponent(),
                      UtilWidget.sizedBox30,
                    ],
                  ).paddingSymmetric(horizontal: AppDimens.defaultPadding)
                ]))
              ],
            ),
          ),
          Obx(
            () => BaseButton(
              function: controller.changePassword,
              backgroundColor: HexColor.fromHex(
                controller.isInputFieldComplete.value ? "#2C44BB" : "#D9D9D9",
              ),
              titleButton: ChangePasswordStr.confirm,
              colorText: controller.isInputFieldComplete.value
                  ? Colors.white
                  : Colors.black,
            ),
          ),
          UtilWidget.sizedBoxHeightSafeAreaBottom(context),
          UtilWidget.sizedBox30,
        ],
      ),
    );
  }
}


        // leading: CardBuilder(
        //   radiusModel: const RadiusModel(radiusAll: AppDimens.radius8),
        //   onTap: Get.back,
        //   paddingModel: const PaddingModel(paddingAll: AppDimens.paddingSmall),
        //   backgroundColor: HexColor.fromHex("#A0A0A0"),
        //   child: const Icon(
        //     Icons.arrow_back,
        //     color: Colors.black,
        //   ),
        // ),
        // title: const TextBuild(
        //   title: ChangePasswordStr.changePassword,
        //   textColor: Colors.black,
        // ),