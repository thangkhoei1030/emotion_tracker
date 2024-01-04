import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'base_controller.dart';

abstract class BaseSearchAppbarController<T> extends BaseGetxController {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  ScrollController scrollControllerUpToTop = ScrollController();

  RxBool showBackToTopButton = false.obs;

  int pageNumber = 0;

  int totalRecords = 0;

  late ScrollController scrollController;

  final TextEditingController textSearchController = TextEditingController();

  RxBool isSearch = false.obs;

  RxBool isClear = false.obs;

  RxDouble scrollOffset = 0.0.obs;

  double appBarHeight = 70.0;

  final RxList<T> rxList = RxList<T>();

  /// Hàm load more.
  Future<void> onLoadMore();

  /// Hàm refresh page.
  Future<void> onRefresh();

  Future<void> functionSearch();

  @override
  void onInit() {
    scrollControllerUpToTop.addListener(() {
      showBackToTopButton.value = scrollControllerUpToTop.offset >= 100;
    });
    super.onInit();
  }

  bool isScrollToTop() {
    return scrollOffset <= (appBarHeight - kToolbarHeight / 2);
  }
}
