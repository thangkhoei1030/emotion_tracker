import 'package:emotion_tracker/core/src_core.dart';
import 'package:emotion_tracker/feature/src_feature.dart';
import 'package:emotion_tracker/pages/src_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class WelcomeComponent extends GetView<HomeController> {
  const WelcomeComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextBuild(
                title: 'Hi ${controller.userInfoResponse.value.fullName ?? ""}',
                isBoldText: true,
              ),
              Obx(
                () => NetworkImageWidget(
                  widgetProcessCallBack: (context, url, progress) {
                    return Container(
                      color: Colors.transparent,
                      height: 50,
                      width: 50,
                      child: Center(
                          child: LoadingAnimationWidget.bouncingBall(
                        color: Colors.red,
                        size: 20,
                      )),
                    );
                  },
                  widgetImageBuilder: (context, imageProvider) {
                    return CardBuilder(
                      backgroundColor: Colors.transparent,
                      height: 50,
                      width: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  onPressed: () {
                    Get.toNamed(AppRoutes.profileEdit)?.then((value) {
                      if (value != null) {
                        controller.updateUser();
                      }
                    });
                  },
                  urlImage: controller.userInfoResponse.value.avatar.toUrlCDN(),
                ),
              ),
            ],
          ),
        ),
        UtilWidget.sizedBoxPaddingHuge,
        const TextBuild(
          title: "Chào bạn!\nChúc một ngày mới tốt lành",
          isBoldText: true,
          textAlign: TextAlign.start,
          fontSize: 24,
        ),
      ],
    );
  }
}
