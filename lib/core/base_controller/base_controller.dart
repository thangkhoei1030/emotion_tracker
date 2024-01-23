import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:emotion_tracker/core/src_core.dart';
import 'package:emotion_tracker/pages/src_pages.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

class BaseGetxController extends GetxController {
  // Offset offset = Rx<Offset?>(null);
  RxBool isError = false.obs;

  RxBool isShowLoading = false.obs;

  String errorContent = '';

  late DioExceptionListener dioExceptionListener;

  BaseRequest baseRequestController = Get.find();

  ///1 CancelToken để huỷ 1 request.
  ///1 màn hình gắn với 1 controller, 1 controller có nhiều requests khi huỷ 1 màn hình => huỷ toàn bộ requests `INCOMPLETED` tại màn hình đó.
  List<CancelToken> cancelTokens = [];

  /// Sử dụng một số màn bắt buộc sử dụng loading overlay
  RxBool isLoadingOverlay = false.obs;

  /// Sử dụng cho demo78 phát hành hóa đơn có mã
  RxBool isLoadingOverlayIssue = false.obs;

  /// Sử dụng cho demo78 phát hành thành công hóa đơn
  RxBool isIssueSuccess = false.obs;

  // RxBool isDarkMode = RxBool(APP_DATA.read(AppConst.keyIsDarkTheme) ?? false);
  @mustCallSuper
  Future<void> onReloadErrorOccured() async {
    isError.value = false;
  }

  void showIssueSuccess() {
    isIssueSuccess.value = true;
  }

  void hideIssueSuccess() {
    isIssueSuccess.value = false;
  }

  void showLoading() {
    isShowLoading.value = true;
  }

  void hideLoading() {
    isShowLoading.value = false;
  }

  void showLoadingOverlay() {
    isLoadingOverlay.value = true;
    Get.context?.loaderOverlay.show();
  }

  void hideLoadingOverlay() {
    isLoadingOverlay.value = false;
    Get.context?.loaderOverlay.hide();
  }

  void _setOnErrorListener() {
    baseRequestController.setOnErrorListener((error) async {
      await _setOnErrorFormatter(error);
    });
  }

  Future<void> _setOnErrorFormatter(Object error) async {
    isError.value = true;
    if (error is FormatException) {
      BaseResponse baseResponse =
          BaseResponse.fromJson(jsonDecode(error.message));

      if (baseResponse.status != 200) {
        showToastController(baseResponse);
        if (baseResponse.status == 403) {
          Get.offAllNamed(AppRoutes.loginPage);
        }

        // try {
        //   await FirebaseAnalyticsSetup.writeLogErrorResponse(
        //       error: baseResponse.message ?? "");
        // } finally {
        //   Sentry.captureException(error);
        // }
      }
    } else if (error is DioException) {
      dioExceptionListener = DioExceptionListener(error);
      dioExceptionListener.setDioExceptionListener();
      showToast(
        dioExceptionListener.errorTitle,
        toastStatus: ToastStatus.error,
      );
    }
  }

  void showToastController(BaseResponse baseResponse) {
    showToast(
      baseResponse.message ?? "",
      toastStatus:
          baseResponse.status != 200 ? ToastStatus.error : ToastStatus.success,
      gravity: ToastGravity.BOTTOM,
    );
  }

  Future<void> showSnackBar(
    String message, {
    Duration duration = const Duration(seconds: 2),
    Widget? mainButton,
    Color? backgroundColor,
    bool? isSuccess,
  }) async {
    Get.showSnackbar(GetSnackBar(
      messageText: AutoSizeText(
        message.tr,
      ),
      message: message.tr,
      mainButton: Row(
        children: [
          if (mainButton != null) mainButton,
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.close,
            ),
          ),
        ],
      ),
      duration: message.length > 100 ? 5.seconds : duration,
    ));
  }

  void addCancelToken(CancelToken cancelToken) {
    cancelTokens.add(cancelToken);
  }

  void cancelRequest(CancelToken cancelToken) {
    if (!cancelToken.isCancelled) {
      cancelToken.cancel('Cancel when close controller!!!');
    }
  }

  @override
  void onClose() {
    for (var cancelToken in cancelTokens) {
      cancelRequest(cancelToken);
    }
    super.onClose();
  }

  @override
  void onInit() {
    _setOnErrorListener();
    super.onInit();
  }
}
