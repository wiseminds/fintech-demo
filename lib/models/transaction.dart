library transaction;

import 'dart:convert';
import 'dart:ui';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:example/constants/app_colors.dart';
// import 'package:flutter/material.dart';

import 'serializers.dart';
import 'transaction_type.dart';

part 'transaction.g.dart';

abstract class Transaction implements Built<Transaction, TransactionBuilder> {
  Transaction._();

  factory Transaction([updates(TransactionBuilder b)]) = _$Transaction;

  @BuiltValueField(wireName: 'transactionId')
  int get transactionId;
  @BuiltValueField(wireName: 'type')
  String get t;
  @BuiltValueField(wireName: 'amount')
  double get amount;
  @BuiltValueField(wireName: 'comment')
  String? get comment;
  @BuiltValueField(wireName: 'entryDate')
  String? get entryDate;
  @BuiltValueField(wireName: 'currencyCode')
  String get currencyCode;
  @BuiltValueField(wireName: 'balance')
  String get balance;

  DateTime? get date => DateTime.tryParse(entryDate ?? '');
  bool get isPositive => !amount.isNegative;

  Color get color => isPositive ? AppColors.credit : AppColors.debit;

  TransactionType get type {
    switch (t) {
      case 'WITHDRAWAL':
        return TransactionType.withdrawal;
      case 'DEPOSIT':
        return TransactionType.deposit;
      case 'TRANSFER':
        return TransactionType.transafer;

      default:
        return TransactionType.transafer;
    }
  }

  String toJson() {
    return json.encode(serializers.serializeWith(Transaction.serializer, this));
  }

  static Transaction? fromJson(String jsonString) {
    return serializers.deserializeWith(
        Transaction.serializer, json.decode(jsonString));
  }

  static Serializer<Transaction> get serializer => _$transactionSerializer;
}
