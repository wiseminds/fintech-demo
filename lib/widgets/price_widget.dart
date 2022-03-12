import 'dart:io';

import 'package:flutter/material.dart';
import 'package:money_formatter/money_formatter.dart';

class PriceWidget extends StatelessWidget {
  final double price;
  final double fontSize;
  final TextStyle? style, iconStyle, prefixStyle, suffixStyle;
  final String? prefix, suffix;
  final double? discount;
  final Color? color;
  final bool isNaira;
  final bool compact;
  final bool showIcon;
  final bool showDecimal;
  final double? decimalRatio;
  final FontWeight? fontWeight;

  static const NAIRA = '₦';

  /// breakpoint from which to switch to compact mode
  final double? compactThreshold;

  const PriceWidget(
      {Key? key,
      required this.price,
      this.fontSize = 14,
      this.style,
      this.fontWeight,
      this.discount,
      this.compactThreshold,
      this.color,
      this.isNaira = true,
      this.decimalRatio = 1,
      this.compact = false,
      this.showIcon = true,
      this.showDecimal = true,
      this.prefixStyle,
      this.suffixStyle,
      this.prefix = '',
      this.suffix = '',
      this.iconStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _style = style ??
        Theme.of(context).textTheme.bodyText2?.copyWith(
            fontWeight: fontWeight ?? FontWeight.bold,
            fontSize: fontSize,
            color: color);
    var p = price;
    var formattedPrice = MoneyFormatter(
      amount: p,
      settings: MoneyFormatterSettings(
        fractionDigits: 2,
      ),
    );

    return Container(
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Text.rich(
              TextSpan(text: '', children: [
                if (prefix != null && (prefix?.isNotEmpty ?? false))
                  TextSpan(
                      text: prefix ?? '',
                      style: prefixStyle ??
                          _style?.copyWith(fontFamily: '', fontSize: fontSize)),
                if (showIcon)
                  TextSpan(
                      text: '₦ ',
                      style: iconStyle ??
                          _style?.copyWith(
                              fontFamily:
                                  Platform.isAndroid ? '' : 'Product Sans',
                              fontSize: fontSize,
                              fontWeight: FontWeight.bold)),
                TextSpan(
                    text: (compact &&
                            (compactThreshold == null ||
                                (price > (compactThreshold ?? 0))))
                        ? formattedPrice.output.compactNonSymbol.toLowerCase()
                        : showDecimal
                            ? formattedPrice.output.nonSymbol
                            : formattedPrice.output.withoutFractionDigits),
                if (suffix != null && (suffix?.isNotEmpty ?? false))
                  TextSpan(
                      text: suffix ?? '',
                      style: suffixStyle ??
                          _style?.copyWith(fontFamily: '', fontSize: fontSize)),
              ]),
              style: _style),
        ],
      ),
    );
  }
}
