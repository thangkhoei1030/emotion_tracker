import 'dart:convert';

import 'package:emotion_tracker/core/src_core.dart';

class BaseResponseList<T> {
  String? code;
  int? status;
  String? message;
  ExtendModel? extend;
  List<T> data;
  BaseResponseList({
    this.code,
    this.status,
    this.message,
    this.extend,
    this.data = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'status': status,
      'message': message,
      'extend': extend,
    };
  }

  factory BaseResponseList.fromJson(
    Map<String, dynamic> json,
    Function(dynamic x) func,
  ) {
    return BaseResponseList(
      code: json['code'],
      status: json['status']?.toInt(),
      message: json['message'],
      extend: ExtendModel.fromJson(json['extend']),
      data: json["data"] != null
          ? List<T>.from(json["data"].map((x) => func(x)))
          : [],
    );
  }

  String toJson() => json.encode(toMap());
}
