import 'dart:convert';

import 'package:example/data/api/api_provider.dart';
import 'package:example/data/api/api_response.dart';
import 'package:example/data/api/api_request.dart';

class MockApiProvider extends ApiProvider {
  @override
  Future<ApiResponse<ResponseType, InnerType>> send<ResponseType, InnerType>(
      ApiRequest<ResponseType, InnerType> request) async {
    return ApiResponse<ResponseType, InnerType>(
      request: request,
      bodyString: body,
      statusCode: 200,
    ).resolve;
  }
}

final body = jsonEncode({
  "status": "Successful",
  "code": "MwI00",
  "message": "Successful",
  "data": {
    "clientTransactions": [
      {
        "transactionId": 148818,
        "type": "TRANSFER",
        "amount": -4000.0,
        "comment":
            "Transfer: Transferred from Olawale Renmoney Account from 3580016662",
        "entryDate": "2022-03-09T09:29:09+0000",
        "currencyCode": "NGN",
        "balance": "88900"
      },
      {
        "transactionId": 148816,
        "type": "TRANSFER",
        "amount": -5600.0,
        "comment":
            "Transfer: Transferred from Olawale Renmoney Account from 3580016662",
        "entryDate": "2022-03-09T09:28:44+0000",
        "currencyCode": "NGN",
        "balance": "92900"
      },
      {
        "transactionId": 148815,
        "type": "DEPOSIT",
        "amount": 1000.0,
        "comment":
            "Payment on investment from Paystack with auth_code AUTH_7j6h47njx4",
        "entryDate": "2022-03-09T09:28:25+0000",
        "currencyCode": "NGN",
        "balance": "98500"
      },
      {
        "transactionId": 148814,
        "type": "WITHDRAWAL",
        "amount": -500.0,
        "comment":
            "BillPayment Airtime Purchase Reference: bd9438f2-d05c-4562-a37d-8a753c310aba",
        "entryDate": "2022-03-09T09:27:11+0000",
        "currencyCode": "NGN",
        "balance": "97500"
      },
      {
        "transactionId": 148813,
        "type": "DEPOSIT",
        "amount": 90000.0,
        "comment":
            "Payment on investment from Paystack with auth_code AUTH_7j6h47njx4",
        "entryDate": "2022-03-09T09:26:40+0000",
        "currencyCode": "NGN",
        "balance": "98000"
      },
      {
        "transactionId": 148811,
        "type": "TRANSFER",
        "amount": -2000.0,
        "comment": "Transfer: 2K from 3580016662",
        "entryDate": "2022-03-09T09:26:19+0000",
        "currencyCode": "NGN",
        "balance": "8000"
      },
      {
        "transactionId": 148810,
        "type": "DEPOSIT",
        "amount": 10000.0,
        "comment": null,
        "entryDate": "2022-03-09T09:24:23+0000",
        "currencyCode": "NGN",
        "balance": "10000"
      }
    ]
  }
});
