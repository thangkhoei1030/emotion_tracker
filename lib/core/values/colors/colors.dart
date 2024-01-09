import 'package:emotion_tracker/core/src_core.dart';
import 'package:flutter/material.dart';

class AppColors {
  static AppColors? _instance;

  factory AppColors() => _instance ??= AppColors._internal();

  AppColors._internal();

  // for Light Theme
  static const darkPrimaryColor = Color(0xFF3e4161);
  static const darkAccentColor = Color(0xFF25273f);

  static const Color colorLoading = Color(0xFF58a0ff);
  static const Color colorBackgroundLight = Color(0xFFf7f7f7);
  static const Color chipDisable = Color(0xFFefefef);
  static const Color orange = Color(0xFFe2530c);
  static const Color orangeShade = Color(0xFFfee0d6);

  static const List<Color> colorGradientBlue = [
    Color(0xFF58a0ff),
    Color(0xFF5967ff),
  ];
  static const List<Color> colorGradientBlueLogin = [
    Color(0xFF5967ff),
    Color(0xFF5967ff),
    // Color(0xFF596AFE),
  ];
  static const List<Color> colorGradientBlack = [
    Colors.black,
    Colors.black87,
  ];
  static const List<Color> colorGradientGrey = [
    Color(0xFF9ca4bc),
    Color(0xFF9ca4bc)
  ];
  static const List<Color> colorWhite = [
    Color.fromARGB(255, 255, 255, 255),
    Color.fromARGB(255, 255, 255, 255)
  ];

  static const List<Color> colorGradientGray = [
    Color(0x20FFFFFF),
    Color(0x20FFFFFF),
  ];

  static const List<List<Color>> colorGradientList = [
    [Color(0xFFD4145A), Color(0xFFFBB03B)],
    [Color(0xFF4568dc), Color(0xFFb06ab3)],
    [Color(0xFF588be5), Color(0xFF3ac9dd)],
  ];
  static const List<Color> colorPieDashboard = [
    Color(0xFF2697fe),
    Color(0xffbf5efe),
    Color(0xFF19eaaa),
    Color(0xFFffcf27),
    Color(0xFFff6057),
  ];

  static const List<Color> colorStatusHistoryTitle = [
    Color(0xFF03A9F4),
    Color(0xFFff6057),
    Color(0xFF8DBD26),
  ];

  static const List<Color> colorGradientIconHome = [
    Color(0xFFfd754a),
    Color(0xFFfd8058),
  ];

  static List<Color> colorGradientBtn = [
    Colors.blue.shade200,
    Colors.teal.shade50,
  ];

  static const List<Color> colorGradientGreen = [
    Color.fromARGB(255, 43, 255, 191),
    Color.fromARGB(255, 0, 231, 162),
  ];

  static List<BoxShadow> listDefaultShadow = [
    BoxShadow(
      color: Colors.cyan.withOpacity(1), //color of shadow
      spreadRadius: 2, //spread radius
      blurRadius: 3, // blur radius
      offset: const Offset(1, 2), // changes position of shadow
      //first paramerter of offset is left-right
      //second parameter is top to down
    ),
    const BoxShadow(
      color: Colors.white, //color of shadow
      spreadRadius: 4, //spread radius
      blurRadius: 6, // blur radius
      offset: Offset(2, 3), // changes position of shadow
      //first paramerter of offset is left-right
      //second parameter is top to down
    ),
  ];

  static List<Color> backgroundColorLogin = [
    HexColor.fromHex("6D97EB")!,
    HexColor.fromHex("3048C9")!,
  ];

  static List<Color> mainBackGroundColor = [
    HexColor.fromHex("6E99EC")!,
    HexColor.fromHex("2E46C8")!,
  ];

  static List<Color> emotionStatisticalBackgroundColor = [
    HexColor.fromHex("6E99EC")!,
    HexColor.fromHex("2F47C8")!,
  ];

  static List<Color> cardBackgroundColor = [
    HexColor.fromHex("5679DE")!,
    HexColor.fromHex("324BCA")!,
  ];
  static List<Color> chartBackGroundColor = [
    HexColor.fromHex("8AB9FF")!,
    HexColor.fromHex("4463D5")!,
  ];
  static List<Color> barChartColor = [
    HexColor.fromHex("FFD448")!,
    HexColor.fromHex("FFFFFF")!,
  ];
  static List<Color> cardBackGroundStatiscalDay = [
    HexColor.fromHex("6E99EC")!,
    HexColor.fromHex("2E46C8")!,
  ];
}
