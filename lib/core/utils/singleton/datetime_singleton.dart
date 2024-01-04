import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:emotion_tracker/core/src_core.dart';

class DateTimeFormat {
  static DateTimeFormat? _instance;

  factory DateTimeFormat() => _instance ??= DateTimeFormat._();

  DateTimeFormat._();

  DateTime convertTimeStampToDate(int timer) =>
      DateTime.fromMillisecondsSinceEpoch(timer * 1000);

  Future<DateTime?> showDateTimePickerMaterial({DateTime? dateInitial}) async {
    return await showDatePicker(
      context: Get.context!,
      initialDate: dateInitial ?? DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime(2099),
    );
  }

  String getDayOfWeakFromDay(int day) {
    switch (day) {
      case 1:
        return "Thứ 2";
      case 2:
        return "Thứ 3";
      case 3:
        return "Thứ 4";
      case 4:
        return "Thứ 5";
      case 5:
        return "Thứ 6";
      case 6:
        return "Thứ 7";
      case 7:
        return "Chủ nhật";
      default:
        return "";
    }
  }

  String convertTimeStampToString(int timeStamp, String pattern) {
    return convertToString(convertTimeStampToDate(timeStamp), pattern);
  }

  String convertToString(DateTime? dateTime, String pattern,
      {bool isTextDefault = true}) {
    if (dateTime == null) {
      if (isTextDefault) {
        return AppStr.defaultDateInValid;
      }
      return "";
    }
    return DateFormat(pattern).format(dateTime);
  }

  DateTime? convertStringToDate(
      String dateTimeString, String patternOfDateString) {
    try {
      return DateFormat(patternOfDateString).parse(dateTimeString);
    } catch (e) {
      return null;
    }
  }
}
