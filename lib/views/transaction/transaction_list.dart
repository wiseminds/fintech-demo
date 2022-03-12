import 'package:example/models/transaction.dart';
import 'package:example/widgets/content_placeholder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'cubit/transaction_cubit.dart';
import 'transaction_tile.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({Key? key}) : super(key: key);

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  late TransactionCubit _cubit;

  @override
  initState() {
    _cubit = TransactionCubit();
    _cubit.load();
    super.initState();
  }

  @override
  dispose() {
    _cubit.close();
    super.dispose();
  }

  static Widget _placeholder(BuildContext context) => ListView.builder(
      itemCount: 10,
      // shrinkWrap: true,
      itemBuilder: (c, i) => ContentPlaceholder(
            child: AbsorbPointer(
                child: TransactionTile(
              data: Transaction((b) => b
                ..amount = 100
                ..entryDate = DateTime.now().toIso8601String()
                ..amount = 0
                ..balance = '*****'
                ..currencyCode = '*****'
                ..t = 'DEPOSIT'
                ..transactionId = 0
                ..comment = '***** ***** '),
            )),
          ));
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      bloc: _cubit,
      builder: (context, state) {
        return SmartRefresher(
            enablePullDown: true,
            enablePullUp: false,
            primary: true,
            header: const ClassicHeader(
              refreshStyle: RefreshStyle.Follow,
              completeText: '',
              failedText: '',
              refreshingIcon: CupertinoActivityIndicator(),
              completeDuration: Duration(milliseconds: 800),
            ),
            onRefresh: _cubit.load,
            controller: _cubit.controller,
            child: state.data != null && state.data!.isNotEmpty
                ? ListView.builder(
                    itemCount: state.data!.length,
                    itemBuilder: (c, i) => Padding(
                      padding: EdgeInsets.only(
                          bottom:
                              10.0 + (i == (state.data!.length - 1) ? 100 : 0)),
                      child: TransactionTile(data: state.data![i]),
                    ),
                  )
                : state.isLoading
                    ? _placeholder(context)
                    // const Center(child: CupertinoActivityIndicator())

                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(30.0),
                            child: Icon(Icons.business_center_outlined),
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Text(
                                  state.message ?? 'No transactions here',
                                  style:
                                      Theme.of(context).textTheme.bodyText2)),
                        ],
                        //
                      ));
      },
    );
  }
}
