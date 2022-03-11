import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'second_view.dart';

class FirstView extends StatelessWidget {
  const FirstView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(middle: Text('First View')),
      body: Center(
        child: ElevatedButton(
          child: Text('Go to second view',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: Colors.white)),
          onPressed: () {
            Navigator.push(context,
                CupertinoPageRoute(builder: (c) => const SecondView()));
          },
        ),
      ),
    );
  }
}
