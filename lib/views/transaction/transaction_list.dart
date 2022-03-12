import 'package:flutter/material.dart';

import 'transaction_tile.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({Key? key}) : super(key: key);

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (c, i) => Padding(
        padding: EdgeInsets.only(bottom: 10.0 + (i == 9 ? 100 : 0)),
        child: const TransactionTile(),
      ),
    );
  }
}
