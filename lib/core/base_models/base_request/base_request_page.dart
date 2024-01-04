class BaseRequestPage<T> {
  final String pageType;
  final String? blockCode;
  final String? code;
  final String? params;

  final T? data;
  const BaseRequestPage({
    required this.pageType,
    //BlockCode
    this.blockCode,
    //PageCode
    this.code,
    this.data,
    this.params,
  });

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T?) function) {
    Map<String, dynamic> mapRequest = {
      "page_type": pageType,
      "block_code": blockCode,
      "code": code,
      'params': params,
    };

    if (data != null) {
      mapRequest.addAll(function(data));
    }
    return mapRequest;
  }

  @override
  String toString() => //,dateTime: ${dateTime.toIso8601String()}
      'BaseRequestPage(pageType: $pageType, data: ${data.toString()},String: $blockCode, code: $code)';

  BaseRequestPage<T> copyWith({
    String? pageType,
    String? blockCode,
    String? code,
    T? data,
    String? params,
  }) {
    return BaseRequestPage<T>(
      pageType: pageType ?? this.pageType,
      blockCode: blockCode ?? this.blockCode,
      code: code ?? this.code,
      data: data ?? this.data,
      params: params ?? this.params,
    );
  }
}
