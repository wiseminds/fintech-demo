import 'package:example/constants/strings.dart';
import 'package:example/core/extensions/context.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'transaction/transaction_screen.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text(
          'First View',
          style: context.headline5,
        ),
        backgroundColor: context.backgroundColor,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text(Strings.toTransaction,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: Colors.white)),
          onPressed: () {
            Navigator.push(context,
                CupertinoPageRoute(builder: (c) => const TransactionScreen()));
          },
        ),
      ),
    );
  }
}
