import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:emotion_tracker/core/src_core.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingWidget {
  static Widget get loadingThreeDots =>
      LoadingAnimationWidget.threeRotatingDots(color: Colors.red, size: 25);

  static Widget get loadingBouncing =>
      LoadingAnimationWidget.bouncingBall(color: Colors.red, size: 25);
}

mixin GetViewLoading {
  static const String dataPending = "Đang lấy dữ liệu";
  Widget loadingWidget({
    required RxBool isShowLoading,
    required WidgetCallback child,
    bool isShowTitleLoading = false,
    String title = dataPending,
  }) {
    return Obx(
      () => isShowLoading.value
          ? Center(
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.transparent,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoadingWidget.loadingBouncing,
                    UtilWidget.sizedBox10,
                    Flexible(
                      child: TextBuild(
                        title: title,
                        overflow: TextOverflow.visible,
                        maxLines: 2,
                      ),
                    )
                  ],
                ),
              ),
            )
          : child(),
    );
  }
}
