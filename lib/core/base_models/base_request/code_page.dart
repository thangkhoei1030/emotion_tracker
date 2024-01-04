class CodePage {
  CodePage({
    required this.code,
  });

  final String? code;

  CodePage copyWith({
    String? code,
  }) {
    return CodePage(
      code: code ?? this.code,
    );
  }

  factory CodePage.fromJson(Map<String, dynamic> json) {
    return CodePage(
      code: json["code"],
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
      };
}
