class Page {
  Page({
    required this.name,
    required this.code,
    required this.pageTitle,
  });

  final String? name;
  final String? code;
  final String? pageTitle;
  factory Page.fromJson(Map<String, dynamic> json) {
    return Page(
      name: json["name"],
      code: json["code"],
      pageTitle: json["page_title"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
        "page_title": pageTitle,
      };
}
