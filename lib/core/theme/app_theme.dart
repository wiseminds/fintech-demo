import 'package:example/constants/app_colors.dart';
import 'package:example/constants/fonts.dart';
import 'package:flutter/material.dart';

import 'input_decoration.dart';
import 'text_theme.dart';

class AppTheme {
  String get font => Fonts.productSans;
  Color get primary => AppColors.primary;
  Color get accent => AppColors.debit;
  Color get secondary => AppColors.debit;
  Color get backgroundColor => AppColors.backgroundColorLight;
  Color get backgroundColorDark => AppColors.backgroundColorDark;
  Color get cardColor => AppColors.cardColorLight;
  Color get cardColorDark => AppColors.cardColorDark;
  Color get disabled => const Color(0x2821201D);

  InputDecorationTheme get inputDecorationTheme =>
      AppInputDecoration.inputDecoration(
        color: AppColors.borderColor,
        font: font,
        disabled: const Color(0xff21201D).withOpacity(.4),
        error: Colors.red,
      );

  InputDecorationTheme get inputDecorationThemeDark =>
      AppInputDecoration.inputDecoration(
          color: Colors.white,
          font: font,
          error: Colors.red,
          disabled: Colors.white24);

  TextTheme get _textThemeDark => AppTextTheme.textTheme(
        color: Colors.white,
        font: font,
        primary: AppColors.primaryLight,
      );
  TextTheme get _textThemeLight => AppTextTheme.textTheme(
      color: AppColors.textBlack, font: font, primary: AppColors.primary);

  ColorScheme get _lightScheme => ColorScheme(
      brightness: Brightness.light,
      background: backgroundColor,
      onBackground: AppColors.textBlack,
      primary: primary,
      onPrimary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      surface: Colors.white,
      onSurface: AppColors.primary,
      secondary: secondary,
      onSecondary: AppColors.textBlack);

  ColorScheme get _darkScheme => ColorScheme(
      brightness: Brightness.dark,
      background: backgroundColorDark,
      onBackground: Colors.white,
      primary: AppColors.primaryLight,
      onPrimary: Colors.black,
      error: Colors.redAccent,
      onError: Colors.white,
      surface: Colors.black,
      onSurface: Colors.white,
      secondary: secondary,
      onSecondary: Colors.white);

  ThemeData get dark => ThemeData.dark().copyWith(
      primaryColor: AppColors.primary,
      textTheme: _textThemeDark,
      cardColor: AppColors.cardColorDark,
      canvasColor: AppColors.canvasColorDark,
      textSelectionTheme: const TextSelectionThemeData(
          cursorColor: AppColors.primary,
          selectionHandleColor: AppColors.primary,
          selectionColor: AppColors.primary),
      colorScheme: _darkScheme,
      backgroundColor: backgroundColorDark,
      inputDecorationTheme: inputDecorationThemeDark);

  ThemeData get light => ThemeData.light().copyWith(
      textTheme: _textThemeLight,
      focusColor: accent,
      cardColor: AppColors.cardColorLight,
      textSelectionTheme: const TextSelectionThemeData(
          cursorColor: AppColors.primary,
          selectionHandleColor: AppColors.primary,
          selectionColor: AppColors.primary),
      primaryColor: primary,
      colorScheme: _lightScheme,
      disabledColor: const Color(0xff21201D).withOpacity(.4),
      backgroundColor: backgroundColor,
      inputDecorationTheme: inputDecorationTheme);
}
