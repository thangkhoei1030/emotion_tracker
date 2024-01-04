import 'package:dio/dio.dart';
import 'package:emotion_tracker/core/src_core.dart';

class DioExceptionListener {
  late final String errorTitle;

  late final String descriptionError;

  late final DioException exception;
  
  DioExceptionListener(this.exception);

  void setDioExceptionListener() {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
        errorTitle = ErrorStr.titleConnectTimeOut;
        descriptionError = ErrorStr.descriptionErrorConnectTimeOut;
        break;
      case DioExceptionType.unknown:
        errorTitle = ErrorStr.errorUnknown;
        descriptionError = ErrorStr.descriptionError;
        break;
      case DioExceptionType.connectionError:
        errorTitle = exception.message ?? "";
        break;
      default:
        errorTitle = "";
    }
  }
}
