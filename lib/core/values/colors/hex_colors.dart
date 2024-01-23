import 'package:emotion_tracker/core/src_core.dart';
import 'package:flutter/material.dart';

class ColorLight {
  static Color starUnselectColors = HexColor.fromHex("#D2D2D2")!;
  static Color startColors = HexColor.fromHex("#FF7948")!;
  static Color buttonDefaultColor = HexColor.fromHex("#FCE8E0")!;
  static Color inputDefaultColor = HexColor.fromHex("#EEF3FF")!;
  static Color defaultColorBorderInput = HexColor.fromHex("#707070")!;
  static Color primaryColor = HexColor.fromHex("#f9f9f9")!;
  static Color borderCard = HexColor.fromHex("CCF2F4")!;
  static const Color cardBackGroundColor = Colors.white;
  static const Color seeAllTextButtonColor = Colors.red;
  static Color colorBackGroundInput = inputDefaultColor;
}

class ColorDark {
  static Color primaryColor = HexColor.fromHex("#9754CB")!;
  static Color secondaryColor = HexColor.fromHex("#03DAC5")!;
  static Color backgroundColorApp = HexColor.fromHex("#121212")!;
  static Color cardBackGroundColor = HexColor.fromHex("#1F1B24")!;
  static Color seeAllTextButtonColor = primaryColor;
  static Color colorBackGroundInput = HexColor.fromHex("#333333")!;
  static Color textLabelInput = HexColor.fromHex("#FFFF00")!;
  static Color borderInput = textLabelInput;
}
