import 'package:built_collection/built_collection.dart';
import 'package:example/data/api/api_response.dart';
import 'package:example/data/api/data_repository.dart';
import 'package:example/data/api_services/transaction_api_service.dart';
import 'package:example/models/transaction.dart';

class TransactionRepository  extends DataRepository{
  final _apiService = TransactionApiService();


 Future<ApiResponse<BuiltList<Transaction>, Transaction>> loadTransactions() async {
   return await handleRequest<BuiltList<Transaction>, Transaction>(() =>
            _apiService.transactions());

  }
}
