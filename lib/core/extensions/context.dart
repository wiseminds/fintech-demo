import 'package:flutter/material.dart';

extension B on BuildContext {
  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  /// caption text style same as [Theme.of(this).textTheme.caption]
  TextStyle? get caption => Theme.of(this).textTheme.caption;
  TextStyle? get subtitle1 => Theme.of(this).textTheme.subtitle1;

  /// headline5 text style same as [Theme.of(this).textTheme.headline5]
  TextStyle? get headline5 => Theme.of(this).textTheme.headline5;

  /// headline4 text style same as [Theme.of(this).textTheme.headline4]
  TextStyle? get headline4 => Theme.of(this).textTheme.headline4;

  /// headline5 text style same as [Theme.of(this).textTheme.headline3]
  TextStyle? get headline3 => Theme.of(this).textTheme.headline3;

  /// bodyText1 text style same as [Theme.of(this).textTheme.bodyText1]
  TextStyle? get bodyText1 => Theme.of(this).textTheme.bodyText1;

  /// bodyText2 text style same as [Theme.of(this).textTheme.bodyText2]
  TextStyle? get bodyText2 => Theme.of(this).textTheme.bodyText2;

  Color get backgroundColor => Theme.of(this).backgroundColor;
  Color get cardColor => Theme.of(this).cardColor;
  Color get canvasColor => Theme.of(this).canvasColor;
  Color get disabledColor => Theme.of(this).disabledColor;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  Color get primaryColor => Theme.of(this).primaryColor;
  Size get size => MediaQuery.of(this).size;
}
