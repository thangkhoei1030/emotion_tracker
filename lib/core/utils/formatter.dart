import 'dart:convert';

import 'package:crypto/crypto.dart' as crypto;
import 'package:emotion_tracker/core/src_core.dart';


String formatInvoiceNo(num? number) {
  return formatNumber(number, 7);
}

String formatBillNo(num? number) {
  return formatNumber(number, 9);
}

String formatDeviceCode(num? number) {
  return formatNumber(number, 3);
}

String formatNumber(num? number, int length) {
  number ??= 0;
  String invoiceNo = number.toInt().toString();

  final int count = length - invoiceNo.length;

  for (int index = 0; index < count; index++) {
    invoiceNo = '0$invoiceNo';
  }
  return invoiceNo;
}

String formatHourNo(int number) {
  return formatNumber(number, 2);
}


String twoDigits(int n) {
  if (n >= 10) return '$n';
  return '0$n';
}

String formatBySeconds(Duration duration) =>
    twoDigits(duration.inSeconds.remainder(60));

String formatByMinutes(Duration duration) {
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  return '$twoDigitMinutes:${formatBySeconds(duration)}';
}

String formatByHours(Duration duration) {
  return '${twoDigits(duration.inHours)}:${formatByMinutes(duration)}';
}

String formatPassword(String password) {
  return crypto.sha256.convert((utf8.encode(password))).toString();
}

String encodePasswordIssueInv(String password) {
  return base64Encode(utf8.encode(password));
}

String decodePasswordIssueInv(String password) {
  return utf8.decode(base64Decode(password));
}

int getDefaultId(int? id) {
  return id ?? AppConst.defaultIdInvalid;
}

String getDefaultFormatCurrency({bool isDot = AppConst.isDot}) {
  return isDot ? '.' : ',';
}

String getDoubleDefaultFormatCurrency({bool isDot = AppConst.isDot}) {
  return isDot ? '..' : ',,';
}

int convertBoolToInt(bool? value) => (value ?? false) ? 1 : 0;

bool convertIntToBool(int? value) => value == 1;
