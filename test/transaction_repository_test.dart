import 'package:example/core/env.dart';
import 'package:example/data/api/api_provider.dart';
import 'package:example/data/providers/mock_api_provider.dart';
import 'package:example/views/transaction/cubit/transaction_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() {
  final _repository = TransactionRepository();
  setUpAll(() {
    GetIt.I.registerSingleton<ApiProvider>(MockApiProvider());
    GetIt.I.registerSingleton<Env>(kDebugMode ? Developemt() : Production());
  });

  test('ApiProvider test', () async {
    final response = await _repository.loadTransactions();

    expect(response.body, isNotNull);
    expect(response.isSuccessful, true);
    expect(response.error, null);
  });
}
