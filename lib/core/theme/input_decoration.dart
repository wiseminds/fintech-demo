import 'package:example/constants/app_colors.dart';
import 'package:flutter/material.dart';

import 'app_theme.dart';

class AppInputDecoration {
  static InputDecorationTheme inputDecoration(
          {required String font,
          required Color color,
          required Color disabled,
          required Color error}) =>
      InputDecorationTheme(
          focusColor: AppColors.primary,
          floatingLabelStyle: TextStyle(
              fontFamily: font,
              color: AppColors.primary,
              fontSize: 16,
              // height: 0.0,
              fontWeight: FontWeight.w500),
          errorMaxLines: 1,
          isCollapsed: true,

          // isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 27.0, vertical: 16.5),
          helperMaxLines: 3,
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: BorderSide(color: disabled)),
          prefixStyle: TextStyle(
              fontFamily: font,
              color: color.withOpacity(.7),
              fontWeight: FontWeight.w400),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: const BorderSide(color: Colors.red, width: 1.5)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: BorderSide(color: color.withOpacity(.9))),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: const BorderSide(color: Colors.red)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: BorderSide(color: color.withOpacity(.8), width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide:
                  const BorderSide(color: AppColors.primary, width: 1.5)));
}
