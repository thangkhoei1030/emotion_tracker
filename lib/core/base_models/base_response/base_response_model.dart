import 'dart:convert';

import 'package:emotion_tracker/core/src_core.dart';

class BaseResponse<T> {
  String? code;
  int? status;
  String? message;
  ExtendModel? extend;
  T? data;
  BaseResponse({
    this.code,
    this.status,
    this.message,
    this.extend,
    this.data,
  });

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'status': status,
      'message': message,
      'extend': extend,
    };
  }

  factory BaseResponse.fromJson(Map<String, dynamic> json,
      {Function(dynamic x)? func}) {
    T? funcConvert() => func != null ? func(json["data"]) : json["data"];
    return BaseResponse(
      code: json['code'],
      status: json['status']?.toInt(),
      message: json['message'],
      extend:
          json['extend'] == null ? null : ExtendModel.fromJson(json['extend']),
      data: json["data"] != null ? funcConvert() : null,
    );
  }

  String toJson() => json.encode(toMap());
}
