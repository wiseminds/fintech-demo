import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondView extends StatefulWidget {
  const SecondView({Key? key}) : super(key: key);

  @override
  State<SecondView> createState() => _SecondViewState();
}

class _SecondViewState extends State<SecondView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CupertinoNavigationBar(middle: Text('Second View')),
        body: ListView.builder(
            itemCount: 100,
            itemBuilder: (c, i) => ListTile(
                  leading: const Icon(Icons.star, color: Colors.amber),
                  title: Text('Item $i'),
                )));
  }
}
