part of 'transaction_cubit.dart';

@immutable
class TransactionState extends Equatable {
  final bool isLoading;
  final BuiltList<Transaction>? data;
  final String? message;

  const TransactionState({
    this.isLoading = false,
    this.data,
    this.message,
  });
  TransactionState loading() => TransactionState(isLoading: true, data: data);
  TransactionState copyWith({BuiltList<Transaction>? data, String? message}) =>
      TransactionState(data: data ?? this.data, message: message);
  @override
  List<Object?> get props => [data, isLoading, message];
}
