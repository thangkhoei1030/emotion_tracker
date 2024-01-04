import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'base_controller.dart';

abstract class BaseRefreshGetxController extends BaseGetxController {
  /// Controller của smart refresh.
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  final GlobalKey<SliverAnimatedGridState> animateGridView =
      GlobalKey<SliverAnimatedGridState>();

  final ScrollController scrollControllerUpToTop = ScrollController();

  final RxBool showBackToTopButton = false.obs;

  int pageNumber = 0;

  /// Hàm load more.
  Future<void> onLoadMore();

  /// Hàm refresh page.
  Future<void> onRefresh();
  @override
  Future<void> onReloadErrorOccured() async {
    super.onReloadErrorOccured();
    try {
      showLoadingOverlay();
      await onRefresh();
    } finally {
      hideLoadingOverlay();
    }
  }

  @override
  void onInit() async {
    scrollControllerUpToTop.addListener(() {
      showBackToTopButton.value = scrollControllerUpToTop.offset >= 100;
    });

    super.onInit();
  }

  @override
  void onClose() {
    scrollControllerUpToTop.dispose();
    super.onClose();
  }
}
