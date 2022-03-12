import 'package:example/constants/dimens.dart';
import 'package:example/core/extensions/extensions/index.dart';
import 'package:example/widgets/back.dart';
import 'package:flutter/material.dart';

import 'transaction_list.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.backgroundColor,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.paddingMedium),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Back(),
            23.0.h,
            Text('All Transactions', style: context.headline4),
            23.0.h,
            const Expanded(child: TransactionList())
          ]),
        ),
      ),
    );
  }
}
