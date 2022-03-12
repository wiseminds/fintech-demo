// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:example/constants/strings.dart';
import 'package:example/core/env.dart';
import 'package:example/data/api/api_provider.dart';
import 'package:example/data/providers/http_api_provider.dart';
import 'package:example/data/providers/mock_api_provider.dart';
import 'package:example/main.dart';
import 'package:example/views/transaction/transaction_tile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() {
  setUpAll(() {
    GetIt.I.registerSingleton<ApiProvider>(MockApiProvider());
    GetIt.I.registerSingleton<Env>(kDebugMode ? Developemt() : Production());
  });

  testWidgets('Widgets tests', (WidgetTester tester) async {
    // Build our app and trigger a frame.

    await tester.pumpWidget(const App());
    await tester.pumpAndSettle(const Duration(seconds: 2));

    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.textContaining(Strings.toTransaction), findsOneWidget);
    print('Found flutter button at center of screen');

    print('Tapping welcome button');
    await tester.tap(find.byType(ElevatedButton));

    print('Waiting for app to navigate to next page');
    await tester.pumpAndSettle(const Duration(seconds: 1));

    print('Wait for page to load');

    await tester.pumpAndSettle();

    print('Expects to find at least one transaction tile');
    expect(find.byType(TransactionTile), findsWidgets);

    print('Taps on transaction ');
    await tester.tap(find.byType(TransactionTile).first);

    print('Wait for page to load');
    await tester.pumpAndSettle();

    print('Expects transaction details page');
    expect(find.textContaining(Strings.transactionDetails), findsOneWidget);
  });
}
