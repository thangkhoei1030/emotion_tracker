// import 'package:app_settings/app_settings.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:emotion_tracker/core/src_core.dart';

class ShowPopup {
  static int _numDialog = 0;

  static void _showDialog(Widget dialog,
      {bool isActiveBack = true, bool barrierDismissible = false}) {
    _numDialog++;
    Get.dialog(
      WillPopScope(
        onWillPop: () => onBackPress(isActiveBack),
        child: dialog,
      ),
      barrierDismissible: barrierDismissible,
    ).whenComplete(() => _numDialog--);
  }

  static Future<bool> onBackPress(bool isActiveBack) {
    return Future.value(isActiveBack);
  }

  static void dismissDialog() {
    if (_numDialog > 0) {
      Get.back();
    }
  }

  /// Hiển thị dialog thông báo với nội dung cần hiển thị
  ///
  /// `funtion` hành động khi bấm đóng
  ///
  /// `isActiveBack` có cho phép back từ bàn phím Android hay không, default = true
  ///
  /// `isChangeContext` default true: khi gọi func không close dialog hiện tại (khi chuyển sang màn mới thì dialog hiện tại sẽ tự đóng)
  static void showDialogNotification(
    String content, {
    bool isActiveBack = true,
    Function? function,
    String nameAction = AppStr.close,
  }) {
    _showDialog(
        _DialogCustom(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 15, bottom: 10),
                child: const Icon(
                  Icons.notification_important,
                  // _buildIconDialog(content),
                  size: AppDimens.sizeDialogNotiIcon,
                  color: Colors.blueAccent,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15.0),
                constraints: const BoxConstraints(maxHeight: 200),
                child: SingleChildScrollView(
                  child: AutoSizeText(
                    content,
                    style: TextStyle(fontSize: AppDimens.fontMedium()),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    textScaleFactor: 1,
                  ),
                ),
              ),
              const Divider(
                height: 1,
              ),
              SizedBox(
                  width: double.infinity,
                  // _baseButton(
                  //   function,
                  //   nameAction.tr,
                  //   colorText: AppColors.colorBlueAccent,
                  // ),
                  child: BaseButton(
                    function: () => function?.call(),
                    titleButton: nameAction.tr,
                    colorText: Colors.blueAccent,
                  )),
            ],
          ),
        ),
        isActiveBack: isActiveBack);
  }

  static void showErrorMessage(String error) {
    if (_numDialog < 1) {
      showDialogNotification(error, isActiveBack: false);
    }
  }

  static void showDialogConfirm(
    String content, {
    required Function confirm,
    required String actionTitle,
    bool isActiveBack = true,
    String title = AppStr.notification,
    String exitTitle = AppStr.cancel,
    Function? cancelFunc,
    AnimationDialogType animationType = AnimationDialogType.none,
    bool isAutoCloseDialog = false,
  }) {
    _showDialog(
      _DialogCustom(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            UtilWidget.sizedBox10,
            AnimationDialog(animationDialogType: animationType),
            UtilWidget.sizedBox10,
            TextBuild(
              title: title,
              isBoldText: true,
            ),
            UtilWidget.sizedBox10,
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.defaultPadding,
                vertical: AppDimens.paddingSmall,
              ),
              constraints: const BoxConstraints(maxHeight: 200),
              child: SingleChildScrollView(
                child: TextBuild(
                  title: content.tr,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: BaseButton(
                      backgroundColor: Colors.black,
                      function: () => cancelFunc?.call(),
                      titleButton: exitTitle.tr,
                      colorText: Colors.white,
                      fontSize: AppDimens.sizeTextSmall,
                    ),
                  ),
                  UtilWidget.sizedBoxWidthPadding,
                  Flexible(
                    child: BaseButton(
                      // backgroundColor: AppColors.appColor,
                      function: () => confirm.call(),
                      titleButton: actionTitle.tr,
                      colorText: Colors.black,
                      fontSize: AppDimens.sizeTextSmall,
                    ),
                  ),
                ],
              ).paddingSymmetric(horizontal: AppDimens.defaultPadding),
            ),
            UtilWidget.sizedBoxPadding,
          ],
        ),
      ),
      isActiveBack: isActiveBack,
    );
  }

  static void openAppSetting() {
    showDialogConfirm(
      AppStr.permissionHelper,
      confirm: () {
        //TODO:Open app setting
        Get.back();
        // AppSettings.openAppSettings();
      },
      actionTitle: AppStr.openSettings,
    );
  }

  static void showDialogCustom(
    Widget body, {
    required Function confirm,
    required String actionTitle,
    bool isActiveBack = true,
    String? title,
    String exitTitle = AppStr.cancel,
    Function? cancelFunc,
    bool isAutoCloseDialog = false,
    AnimationDialogType animationType = AnimationDialogType.none,
  }) {
    _showDialog(
      _DialogCustom(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            UtilWidget.sizedBox10,
            AnimationDialog(animationDialogType: animationType),
            UtilWidget.sizedBox10,
            if (title != null)
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: AutoSizeText(
                  title,
                  textScaleFactor: 1,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: AppDimens.fontBiggest(),
                    color: Colors.black,
                  ),
                ),
              ),
            Container(
              padding: const EdgeInsets.all(15.0),
              constraints: const BoxConstraints(maxHeight: 300),
              child: SingleChildScrollView(
                child: body,
              ),
            ),
            const Divider(
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.paddingSmall,
                vertical: AppDimens.paddingVerySmall,
              ),
              child: SizedBox(
                width: double.infinity,
                height: AppDimens.btnMedium,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: BaseButton(
                        function: () {
                          cancelFunc?.call();
                        },
                        titleButton: exitTitle,
                        backgroundColor: Colors.black,
                      ),
                    ),
                    UtilWidget.sizedBoxWidthPadding,
                    Expanded(
                      child: BaseButton(
                        function: () => confirm.call(),
                        titleButton: actionTitle.tr,
                        // backgroundColor: AppColors.appColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      isActiveBack: isActiveBack,
    );
  }
}

class _DialogCustom extends StatelessWidget {
  final Widget child;

  const _DialogCustom({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: SingleChildScrollView(child: child),
    );
  }
}
