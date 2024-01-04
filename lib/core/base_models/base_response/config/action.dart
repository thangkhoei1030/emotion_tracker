class ActionConfigLayout {
  ActionConfigLayout({
    this.pageType,
    this.code,
    this.productId,
    this.params,
  });

  final String? pageType;
  final String? code;
  final int? productId;
  final String? params;

  ActionConfigLayout copyWith({
    String? pageType,
    String? code,
    int? productId,
    String? params,
  }) {
    return ActionConfigLayout(
      pageType: pageType ?? this.pageType,
      code: code ?? this.code,
      productId: productId ?? this.productId,
      params: params ?? this.params,
    );
  }

  factory ActionConfigLayout.fromJson(Map<String, dynamic> json) {
    return ActionConfigLayout(
      pageType: json["page_type"],
      code: json["code"],
      productId: json["product_id"],
      params: json["params"],
    );
  }

  Map<String, dynamic> toJson() => {
        "page_type": pageType,
        "code": code,
        "product_id": productId,
        "params": params,
      };

  @override
  String toString() {
    return 'ActionConfigLayout(pageType: $pageType, code: $code, productId: $productId, params: $params)';
  }
}
