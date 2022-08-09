import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:equatable/equatable.dart';
import 'package:example/constants/strings.dart';
import 'package:example/models/error_model.dart';
import 'package:example/models/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'transaction_repository.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(const TransactionState());

  final RefreshController controller = RefreshController(
      initialRefresh: false, initialLoadStatus: LoadStatus.idle);

  final _repository = TransactionRepository();

  load() async {
    emit(state.loading());
    final response = await _repository.loadTransactions();

    if (response.isSuccessful) {
      controller.refreshCompleted();

      emit(state.copyWith(data: response.body));
    } else {
      controller.refreshFailed();
      emit(state.copyWith(
          message: (response.error as ErrorModel?)?.message ??
              Strings.defaultErrorMessage));
    }
  }
}
