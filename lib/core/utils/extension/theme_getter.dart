import 'package:flutter/material.dart';

extension ThemeGetter on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  Color get backGroundCardColor => Theme.of(this).colorScheme.primaryContainer;

  Color radioSelectedColor([bool isSelected = false]) => isSelected
      ? Theme.of(this).colorScheme.primary
      : Theme.of(this).colorScheme.onBackground;

  Color get primaryColor => Theme.of(this).colorScheme.primary;

  Color get onPrimaryColor => Theme.of(this).colorScheme.onPrimary;

  List<BoxShadow> get boxShadow => isDarkMode
      ? [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ]
      : [
          BoxShadow(
            color: Colors.cyan.withOpacity(0.2), //color of shadow
            spreadRadius: 2, //spread radius
            blurRadius: 3, // blur radius
            offset: const Offset(0, 1), // changes position of shadow
            //first paramerter of offset is left-right
            //second parameter is top to down
          ),
          const BoxShadow(
            color: Colors.white, //color of shadow
            spreadRadius: 4, //spread radius
            blurRadius: 6, // blur radius
            offset: Offset(-2, -4), // changes position of shadow
            //first paramerter of offset is left-right
            //second parameter is top to down
          ),
        ];
}
