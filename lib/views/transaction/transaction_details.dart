import 'package:example/constants/app_colors.dart';
import 'package:example/constants/dimens.dart';
import 'package:example/constants/strings.dart';
import 'package:example/core/extensions/extensions/index.dart';
import 'package:example/models/transaction.dart';
import 'package:example/widgets/back.dart';
import 'package:example/widgets/price_widget.dart';
import 'package:flutter/material.dart';

class TransactionDetails extends StatelessWidget {
  final Transaction data;
  const TransactionDetails({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.isDark ? context.backgroundColor : AppColors.primaryDark,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.paddingMedium),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Back(color: Colors.white),
            23.0.h,
            Text(Strings.transactionDetails,
                style: context.headline4?.copyWith(color: Colors.white)),
            24.0.h,
            Material(
                borderRadius: 10.0.toBorderRadius,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimens.paddingMedium),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        36.0.h,
                        Text(
                          'Detailed summary of transaction',
                          style: context.bodyText1
                              ?.copyWith(color: context.primaryColor),
                        ),
                        7.0.h,
                        TransactionDetailsRow(
                            title: 'Recepient', value: 'John'),
                        TransactionDetailsRow(
                            title: 'Amount', value: data.amount),
                        TransactionDetailsRow(
                            title: 'Transaction Date', value: data.date),
                        TransactionDetailsRow(
                            title: 'Reference',
                            value: data.transactionId.toString()),
                        TransactionDetailsRow(
                            title: 'Status',
                            value: '● Successfull',
                            color: AppColors.credit),
                        57.0.h,
                      ],
                    )))
          ]),
        ),
      ),
    );
  }
}

class TransactionDetailsRow<T> extends StatelessWidget {
  final String title;
  final T value;
  final Color? color;
  const TransactionDetailsRow(
      {Key? key, required this.title, required this.value, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(children: [Text(title), .0.s, _buildValue(context)]),
    );
  }

  Widget _buildValue(BuildContext c) {
    TextStyle? _style = c.bodyText1?.copyWith(
      color: color,
      fontWeight: FontWeight.bold,
    );
    switch (value.runtimeType) {
      case String:
        return Text(
          value as String,
          style: _style,
        );
      case double:
        return PriceWidget(
          // prefix: "${(value as double).isInfinite ? '-' : '+'} ",
          price: (value as double).abs(),
          fontSize: 15,
          style: _style?.copyWith(fontSize: 15),
        );
      case DateTime:
        return Text(
          (value as DateTime).readableFormatMin,
          style: _style,
        );

      default:
        return const Text('');
    }
  }
}
