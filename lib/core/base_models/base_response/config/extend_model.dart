import 'package:emotion_tracker/core/src_core.dart';

class ExtendModel {
  ExtendModel({
    this.page,
    this.cdnUrl,
    this.lang,
    this.logged,
    // this.pagination,
  });

  final Page? page;
  final String? cdnUrl;
  final String? lang;
  final bool? logged;
  // final Pagination? pagination;

  factory ExtendModel.fromJson(Map<String, dynamic> json) {
    return ExtendModel(
        page: json["page"] == null ? null : Page.fromJson(json["page"]),
        cdnUrl: json["cdn_url"],
        lang: json["lang"],
        logged: json["logged"],);
        // pagination: json["pagination"] == null
        //     ? null
        //     : Pagination.fromJson(json["pagination"]));
  }

  Map<String, dynamic> toJson() => {
        "page": page?.toJson(),
        "cdn_url": cdnUrl,
        "lang": lang,
        "logged": logged,
      };
}
