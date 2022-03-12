import 'package:built_collection/built_collection.dart';
import 'package:example/constants/api_urls.dart';
import 'package:example/data/api/api_client.dart';
import 'package:example/data/api/api_methods.dart';
import 'package:example/data/api/api_response.dart';
import 'package:example/data/api/interceptors/json_interceptor.dart';
import 'package:example/models/error_model.dart';
import 'package:example/models/transaction.dart';

import 'base_api_service.dart';

class TransactionApiService extends BaseApiService {
  Future<ApiResponse<BuiltList<Transaction>, Transaction>> transactions() {
    return provider.send<BuiltList<Transaction>, Transaction>(
        ApiClient.baseRequest<BuiltList<Transaction>, Transaction>().copyWith(
            path: ApiUrls.transaction,
            method: ApiMethods.get,
            interceptors: [JsonInterceptor<ErrorModel>()],
            nestedKey: 'data',
            dataKey: 'clientTransactions'));
  }
}
