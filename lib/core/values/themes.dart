import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:emotion_tracker/core/src_core.dart';

class AppTheme {
  static AppTheme? _instance;

  factory AppTheme() => _instance ??= AppTheme._();

  AppTheme._();

  ThemeData getThemeByAppTheme({bool isDarkMode = false}) {
    final primaryColor = isDarkMode ? ColorDark.primaryColor : Colors.cyan;

    final onBackgroundColor = isDarkMode ? Colors.white : Colors.black;

    final backgroundColor =
        isDarkMode ? ColorDark.backgroundColorApp : ColorLight.primaryColor;

    ThemeData base = isDarkMode
        ? ThemeData.dark(useMaterial3: true)
        : ThemeData.light(useMaterial3: true);

    InputDecorationTheme inputDecorationTheme() {
      return base.inputDecorationTheme.copyWith(
        fillColor: primaryColor.withOpacity(0.03),
        labelStyle: Get.textTheme.bodyMedium!.copyWith(
          color: primaryColor,
        ),
        hintStyle: base.textTheme.bodyText1,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimens.radius8),
            borderSide: BorderSide(color: primaryColor)
            // borderSide: BorderSide(color: Colors.grey.shade400),
            ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimens.radius8),
            // borderSide: BorderSide(color: Colors.grey.shade400),
            borderSide: BorderSide(color: primaryColor)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimens.radius8),
          // borderSide: BorderSide(color: AppColors.appColor),
          borderSide: BorderSide(color: primaryColor),
        ),
      );
    }

    // ignore: no_leading_underscores_for_local_identifiers
    TextTheme basicTextTheme() {
      final TextTheme textTheme = base.textTheme;
      // Color subTextColor = isDarkMode ? Colors.white : Colors.white;
      return TextTheme(
        // headline
        headline1: textTheme.headline1!.copyWith(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: onBackgroundColor),
        headline2: textTheme.headline2!.copyWith(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: onBackgroundColor),
        headline3: textTheme.headline3!.copyWith(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: onBackgroundColor),
        headline4: textTheme.headline4!.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: onBackgroundColor),
        headline5: textTheme.headline5!
            .copyWith(fontSize: 22, color: onBackgroundColor),
        headline6: textTheme.headline6!
            .copyWith(fontSize: 20, color: onBackgroundColor),
        // subtitle
        subtitle1: TextStyle(fontSize: 14, color: onBackgroundColor),
        subtitle2: textTheme.subtitle2!
            .copyWith(fontSize: 12, color: onBackgroundColor),
        // body
        bodyText1: textTheme.bodyText1!
            .copyWith(fontSize: 16, color: onBackgroundColor),
        bodyText2: textTheme.bodyText2!
            .copyWith(fontSize: 14, color: onBackgroundColor),
        // caption - chú thích trong app
        caption:
            textTheme.caption!.copyWith(fontSize: 12, color: onBackgroundColor),
        // button
        button:
            textTheme.button!.copyWith(fontSize: 14, color: onBackgroundColor),
      ).apply(
        fontFamily: 'URW DIN',
      );
    }

    BottomSheetThemeData buildBottomSheetTheme() {
      return base.bottomSheetTheme.copyWith(
        backgroundColor: backgroundColor,
        modalBackgroundColor: backgroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
      );
    }

    BottomNavigationBarThemeData bottomNavigationBarTheme() {
      return base.bottomNavigationBarTheme.copyWith(
        backgroundColor: primaryColor,
        elevation: 26,
        unselectedItemColor: onBackgroundColor,
        unselectedIconTheme: IconThemeData(
          color: onBackgroundColor,
        ),
      );
    }

    ButtonThemeData buttonThemeData() {
      return base.buttonTheme.copyWith(
        buttonColor: primaryColor,
      );
    }

    FloatingActionButtonThemeData floatingActionButtonThemeData() {
      return FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        elevation: 0.7,
      );
    }

    IconThemeData buildIconTheme() {
      return IconThemeData(
        color: onBackgroundColor,
        size: 20.0,
      );
    }

    AppBarTheme appBarTheme() {
      return const AppBarTheme(
          backgroundColor: Colors.transparent, scrolledUnderElevation: 0);
    }

    TabBarTheme tabBarTheme() {
      return TabBarTheme(
        dividerColor: primaryColor,
        indicatorColor: primaryColor,
        labelColor: primaryColor,
        overlayColor: const MaterialStatePropertyAll(Colors.transparent),
      );
    }

    final containerColor = isDarkMode
        ? ColorDark.cardBackGroundColor
        : ColorLight.cardBackGroundColor;

    return base.copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: isDarkMode ? Brightness.light : Brightness.dark,
        primary: primaryColor,
        onPrimary: onBackgroundColor,
        secondary: primaryColor,
        onSecondary: primaryColor,
        error: AppColors.colorError,
        onError: AppColors.colorError,
        background: primaryColor,
        onBackground: onBackgroundColor,
        surface: backgroundColor,
        onSurface: onBackgroundColor,
        onPrimaryContainer: containerColor,
        primaryContainer: containerColor,
      ),
      chipTheme: ChipThemeData(
        selectedColor: primaryColor,
        checkmarkColor: onBackgroundColor,
      ),
      iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(backgroundColor),
              iconColor: MaterialStatePropertyAll(onBackgroundColor))),
      textTheme: basicTextTheme(),
      iconTheme: buildIconTheme(),
      buttonTheme: buttonThemeData(),

      // colorScheme: ColorScheme(
      //   brightness: isDarkMode ? Brightness.dark : Brightness.light,
      //   primary: AppColors.appColor,
      //   onPrimary: AppColors.onPrimaryColor,
      //   secondary: AppColors.appColor,
      //   onSecondary: AppColors.onPrimaryColor,
      //   error: Colors.red,
      //   onError: Colors.white,
      //   background: AppColors.appColor,
      //   onBackground: AppColors.onPrimaryColor,
      //   surface: AppColors.appColor,
      //   onSurface: AppColors.onBackground,
      //   primaryContainer: AppColors.appColor,
      // ),
      floatingActionButtonTheme: floatingActionButtonThemeData(),
      appBarTheme: appBarTheme(),
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      bottomSheetTheme: buildBottomSheetTheme(),
      inputDecorationTheme: inputDecorationTheme(),
      bottomNavigationBarTheme: bottomNavigationBarTheme(),
      tabBarTheme: tabBarTheme(),
    );
  }

// AppBarTheme _buildAppBarTheme({bool isDarkMode = false}) {
//   return base(isDarkMode: isDarkMode).appBarTheme.copyWith(
//       elevation: 0.0,
//       systemOverlayStyle: SystemUiOverlayStyle(
//           // systemNavigationBarColor: AppColors.appBarColor(),
//           // statusBarColor: AppColors.appBarColor(),
//           statusBarBrightness:
//               isDarkMode ? Brightness.dark : Brightness.light,
//           statusBarIconBrightness:
//               isDarkMode ? Brightness.dark : Brightness.light),
//       // color: AppColors.accentColorTheme(isDarkMode),
//       iconTheme: _buildIconTheme());
// }

// CardTheme _buildCardTheme(ThemeData base, {bool isDarkMode = true}) {
//   return base.cardTheme.copyWith(
//       color: isDarkMode ? AppColors.darkPrimaryColor : Colors.grey[50],
//       elevation: 0.0);
// }

// DialogTheme _buildDialogTheme(ThemeData base) {
//   return base.dialogTheme
//       .copyWith(backgroundColor: AppColors.cardBackgroundColor());
// }
}
