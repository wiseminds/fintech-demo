import 'package:flutter/material.dart';

import 'app_theme.dart';

class AppTextTheme {
  static TextTheme textTheme(
          {required String font,
          required Color color,
          required Color primary}) =>
      TextTheme(
          caption: TextStyle(
            fontFamily: font,
            color: color.withOpacity(.6),
            fontSize: 11,
            fontWeight: FontWeight.w400,
          ),
          subtitle1: TextStyle(
            fontFamily: font,
            color: primary,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
          bodyText1: TextStyle(
              fontFamily: font, color: color, fontWeight: FontWeight.w400),
          bodyText2: TextStyle(
              fontFamily: font,
              color: color.withOpacity(.6),
              fontWeight: FontWeight.w400),
          headline5: TextStyle(
              fontFamily: font,
              fontSize: 14,
              color: color,
              fontWeight: FontWeight.w700),
          headline4: TextStyle(
              fontFamily: font,
              fontSize: 20,
              color: primary,
              fontWeight: FontWeight.w700),
          headline3: TextStyle(
              fontFamily: font,
              fontSize: 32,
              color: color,
              fontWeight: FontWeight.w700));
}
