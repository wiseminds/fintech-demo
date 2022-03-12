import 'package:example/constants/app_colors.dart';
import 'package:example/constants/svg_strings.dart';
import 'package:example/core/extensions/extensions/context.dart';
import 'package:example/core/extensions/extensions/index.dart';
import 'package:example/widgets/price_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'transaction_details.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({Key? key}) : super(key: key);

  /// build icon based on transaction type
  Widget _buildIcon(BuildContext context) {
    Color color = context.primaryColor;
    String icon = SvgStrings.arrowUp;
    return Material(
        color: color.withOpacity(.2),
        shape: const CircleBorder(),
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.string(icon, color: color)));
  }

  /// build price color based on transaction
  Color get _buildColor {
    return AppColors.credit;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: 8.0.toBorderRadius,
      clipBehavior: Clip.antiAlias,
      color: context.cardColor,
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              CupertinoPageRoute(builder: (c) => const TransactionDetails()));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 16),
          child: Row(
            children: [
              _buildIcon(context),
              8.0.w,
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Money received from Michael',
                    style: context.bodyText1?.copyWith(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  // 8.0.h,
                  Text(
                    DateTime.now().readableFormat,
                    style: context.caption,
                  )
                ],
              )),
              40.0.w,
              PriceWidget(
                price: 50000,
                prefix: "+ ",
                style: context.headline5?.copyWith(color: _buildColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
