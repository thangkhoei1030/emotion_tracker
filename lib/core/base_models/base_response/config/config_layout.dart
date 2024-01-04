import 'dart:convert';

import 'package:emotion_tracker/core/src_core.dart';

class ConfigLayout {
  ConfigLayout({
    this.title,
    this.colorBlock,
    this.numberOnLine,
    this.ipadNumberOnLine,
    this.colorItem,
    this.imageHeight,
    this.imageWidth,
    this.borderRadius,
    this.format,
    this.paddingTopBlock,
    this.paddingBottomBlock,
    this.paddingLeftRightBlock,
    this.marginTopBlock,
    this.marginBottomBlock,
    this.marginLeftRightBlock,
    this.gridviewPaddingTop,
    this.itemLineSpacing,
    this.marginLeftRightItem,
    this.countdownTimer,
    this.action,
    this.element,
    this.styleView,
    this.showNoRecord,
    this.numberRecord,
  });

  final String? title;
  final String? colorBlock;
  final String? numberOnLine;
  final String? ipadNumberOnLine;
  final String? colorItem;
  final String? imageHeight;
  final String? imageWidth;
  final String? borderRadius;
  final String? format;
  final String? paddingTopBlock;
  final String? paddingBottomBlock;
  final String? paddingLeftRightBlock;
  final String? marginTopBlock;
  final String? marginBottomBlock;
  final String? marginLeftRightBlock;
  final String? gridviewPaddingTop;
  final String? itemLineSpacing;
  final String? marginLeftRightItem;
  final dynamic countdownTimer;
  final ActionConfigLayout? action;
  final String? element;
  final String? styleView;
  final String? showNoRecord;
  final String? numberRecord;

  factory ConfigLayout.fromJson(Map<String, dynamic> json) {
    return ConfigLayout(
      title: json["title"],
      colorBlock: json["color_block"],
      numberOnLine: json["number_on_line"],
      ipadNumberOnLine: json["ipad_number_on_line"],
      colorItem: json["color_item"],
      imageHeight: json["image_height"],
      imageWidth: json["image_width"],
      borderRadius: json["border_radius"],
      format: json["format"],
      paddingTopBlock: json["padding_top_block"],
      paddingBottomBlock: json["padding_bottom_block"],
      paddingLeftRightBlock: json["padding_left_right_block"],
      marginTopBlock: json["margin_top_block"],
      marginBottomBlock: json["margin_bottom_block"],
      marginLeftRightBlock: json["margin_left_right_block"],
      gridviewPaddingTop: json["gridview_padding_top"],
      itemLineSpacing: json["item_line_spacing"],
      marginLeftRightItem: json["margin_left_right_item"],
      countdownTimer: int.tryParse(json["countdown_timer"]?.toString() ?? ""),
      action: json["action"] == null || json["action"] == ""
          ? null
          : ActionConfigLayout.fromJson(jsonDecode(json["action"])),
      element: json["element"],
      styleView: json["style_view"],
      showNoRecord: json["show_no_record"],
      numberRecord: json["number_record"],
    );
  }

  Map<String, dynamic> toJson() => {
        "title": title,
        "color_block": colorBlock,
        "number_on_line": numberOnLine,
        "ipad_number_on_line": ipadNumberOnLine,
        "color_item": colorItem,
        "image_height": imageHeight,
        "image_width": imageWidth,
        "border_radius": borderRadius,
        "format": format,
        "padding_top_block": paddingTopBlock,
        "padding_bottom_block": paddingBottomBlock,
        "padding_left_right_block": paddingLeftRightBlock,
        "margin_top_block": marginTopBlock,
        "margin_bottom_block": marginBottomBlock,
        "margin_left_right_block": marginLeftRightBlock,
        "gridview_padding_top": gridviewPaddingTop,
        "item_line_spacing": itemLineSpacing,
        "margin_left_right_item": marginLeftRightItem,
        "countdown_timer": countdownTimer,
        "action": action?.toJson(),
        "element": element,
        "style_view": styleView,
        "show_no_record": showNoRecord,
        "number_record": numberRecord,
      };
}
