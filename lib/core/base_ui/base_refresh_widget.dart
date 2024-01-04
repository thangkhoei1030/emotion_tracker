import 'package:emotion_tracker/core/src_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class BaseRefreshWidget<T extends BaseRefreshGetxController>
    extends BaseGetWidget<T> {
  const BaseRefreshWidget({Key? key}) : super(key: key);

  Widget buildPageReload({
    required Widget child,
    IconData? iconFloating,
    VoidCallback? floatingFunction,
    bool enablePullDown = false,
    bool enablePullUp = false,
    Widget? headerRefresher,
    Widget? footerRefresher,
    Widget? header,
    Widget? footer,
    bool showBackButton = false,
    List<Widget> action = const [],
    Color? backgroundColor,
    TextStyle? titleTextStyle,
    Widget? title,
    Widget? floatingActionButton,
    Widget? headerPinned,
    bool showAppBar = true,
    bool showFloatingButton = false,
    bool safeAreaTop = false,
    Widget? expandedBottom,
    Function()? overrideBackFunction,
  }) {
    return PageScaffold(
      action: action,
      showAppBar: showAppBar,
      floatingActionButton: floatingActionButton,
      showBackButton: showBackButton,
      title: title,
      titleTextStyle: titleTextStyle,
      showFloatingButton: showFloatingButton,
      overrideBackFunction: overrideBackFunction,
      child: Column(
        children: [
          if (headerPinned != null) headerPinned,
          Expanded(
            child: BuildSmartRefreshWidget(
              enablePullDown: enablePullDown,
              enablePullUp: enablePullUp,
              header: headerRefresher,
              footer: footerRefresher,
              controller: controller,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    if (header != null) header,
                    child,
                    if (footer != null) ...[UtilWidget.sizedBoxPadding, footer]
                  ],
                ).paddingSymmetric(
                  horizontal: AppDimens.defaultPadding,
                  vertical: AppDimens.defaultPadding,
                ),
              ),
            ),
          ),
          if (expandedBottom != null) expandedBottom
        ],
      ),
    );
  }
}

class BuildSmartRefreshWidget extends StatelessWidget {
  const BuildSmartRefreshWidget({
    super.key,
    required this.child,
    this.enablePullUp = false,
    this.enablePullDown = false,
    this.header,
    this.footer,
    this.scrollDirection = Axis.vertical,
    this.isUseDefaultHeader = true,
    this.controller,
  });
  final Widget child;
  final bool enablePullUp;
  final bool enablePullDown;
  final Widget? header;
  final Widget? footer;
  final Axis scrollDirection;
  final BaseRefreshGetxController? controller;
  final bool isUseDefaultHeader;

  @override
  Widget build(BuildContext context) {
    return controller != null
        ? SmartRefresher(
            controller: controller!.refreshController,
            physics: const BouncingScrollPhysics(),
            scrollDirection: scrollDirection,
            enablePullUp: enablePullUp,
            enablePullDown: enablePullDown,
            onRefresh: controller!.onRefresh,
            onLoading: controller!.onLoadMore,
            footer: footer,
            child: child,
          )
        : child;
  }
}
