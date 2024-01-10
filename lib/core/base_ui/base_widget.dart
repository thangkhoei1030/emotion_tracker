import 'package:emotion_tracker/core/src_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

abstract class BaseGetWidget<T extends BaseGetxController> extends GetView<T>
    with GetViewLoading {
  const BaseGetWidget({Key? key}) : super(key: key);

  Widget buildWidgets(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // tắt tính năng vuốt trái để back lại màn hình trước đó trên iphone
      onWillPop: () async {
        KeyBoard.hide();
        await 300.milliseconds.delay();
        return true;
      },
      child: buildWidgets(context),
    );
  }

  Widget buildPageLoginCheck(WidgetCallback child,
      {Future Function()? onSuccessLogin}) {
    return child();
    //TODO: Login check widget;
    // return Obx(
    // () => Get.find<AppController>().isLogin.isTrue
    //     ? child()
    // : LoginPage(onSuccessLogin: onSuccessLogin),
    // );
  }

  Widget baseShowLoading(
    WidgetCallback child, {
    bool isLoadingPage = true,
  }) {
    return Obx(
      () => controller.isShowLoading.value
          ? isLoadingPage
              ? PageScaffold(
                  child: loadingWidget(
                    isShowLoading: controller.isShowLoading,
                    child: child,
                    isShowTitleLoading: true,
                  ),
                )
              : loadingWidget(
                  isShowLoading: controller.isShowLoading,
                  child: child,
                  isShowTitleLoading: true)
          : child(),
    );
  }
}

class PageScaffold extends StatelessWidget {
  const PageScaffold({
    super.key,
    required this.child,
    this.showBackButton = false,
    this.action = const [],
    this.title,
    this.titleTextStyle,
    this.floatingActionButton,
    this.showAppBar = true,
    this.showFloatingButton = false,
    this.overrideBackFunction,
    this.backgroundColor,
    this.backgroundColorAppBar,
    this.resizeToAvoidBottomInset = true,
  });

  final bool showBackButton;

  final Widget child;

  final List<Widget> action;

  final Widget? title;

  final TextStyle? titleTextStyle;

  final Widget? floatingActionButton;

  final bool showAppBar;

  final bool showFloatingButton;

  final Color? backgroundColor;

  final Color? backgroundColorAppBar;

  final Function()? overrideBackFunction;

  final bool resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: backgroundColor,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        appBar: showAppBar
            ? AppBar(
                backgroundColor: backgroundColor,
                automaticallyImplyLeading: false,
                leading: showBackButton
                    ? SimpleButton(
                        onPressed: overrideBackFunction ?? () => Get.back(),
                        child: const Icon(Icons.arrow_back),
                      )
                    : null,
                title: title,
                centerTitle: true,
                actions: action,
                titleTextStyle: titleTextStyle,
                // toolbarHeight: height ?? kToolbarHeight,
              )
            : null,
        floatingActionButton: showFloatingButton
            ? floatingActionButton ??
                FloatingButtonDraggable(
                  isStack: true,
                  // backgroundColor: AppColors.appColor,
                  ///TODO: Bottom sheet
                  onPressed: () => Get.bottomSheet(Container()),
                  iconData: Iconsax.call_outgoing,
                )
            : const SizedBox.shrink(),
        body: child,
      ),
    );
  }
}
