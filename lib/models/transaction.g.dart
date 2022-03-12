// GENERATED CODE - DO NOT MODIFY BY HAND

part of transaction;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Transaction> _$transactionSerializer = new _$TransactionSerializer();

class _$TransactionSerializer implements StructuredSerializer<Transaction> {
  @override
  final Iterable<Type> types = const [Transaction, _$Transaction];
  @override
  final String wireName = 'Transaction';

  @override
  Iterable<Object?> serialize(Serializers serializers, Transaction object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'transactionId',
      serializers.serialize(object.transactionId,
          specifiedType: const FullType(int)),
      'type',
      serializers.serialize(object.t, specifiedType: const FullType(String)),
      'amount',
      serializers.serialize(object.amount,
          specifiedType: const FullType(double)),
      'currencyCode',
      serializers.serialize(object.currencyCode,
          specifiedType: const FullType(String)),
      'balance',
      serializers.serialize(object.balance,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.comment;
    if (value != null) {
      result
        ..add('comment')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.entryDate;
    if (value != null) {
      result
        ..add('entryDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Transaction deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TransactionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'transactionId':
          result.transactionId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'type':
          result.t = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'comment':
          result.comment = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'entryDate':
          result.entryDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'currencyCode':
          result.currencyCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'balance':
          result.balance = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Transaction extends Transaction {
  @override
  final int transactionId;
  @override
  final String t;
  @override
  final double amount;
  @override
  final String? comment;
  @override
  final String? entryDate;
  @override
  final String currencyCode;
  @override
  final String balance;

  factory _$Transaction([void Function(TransactionBuilder)? updates]) =>
      (new TransactionBuilder()..update(updates)).build();

  _$Transaction._(
      {required this.transactionId,
      required this.t,
      required this.amount,
      this.comment,
      this.entryDate,
      required this.currencyCode,
      required this.balance})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        transactionId, 'Transaction', 'transactionId');
    BuiltValueNullFieldError.checkNotNull(t, 'Transaction', 't');
    BuiltValueNullFieldError.checkNotNull(amount, 'Transaction', 'amount');
    BuiltValueNullFieldError.checkNotNull(
        currencyCode, 'Transaction', 'currencyCode');
    BuiltValueNullFieldError.checkNotNull(balance, 'Transaction', 'balance');
  }

  @override
  Transaction rebuild(void Function(TransactionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TransactionBuilder toBuilder() => new TransactionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Transaction &&
        transactionId == other.transactionId &&
        t == other.t &&
        amount == other.amount &&
        comment == other.comment &&
        entryDate == other.entryDate &&
        currencyCode == other.currencyCode &&
        balance == other.balance;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, transactionId.hashCode), t.hashCode),
                        amount.hashCode),
                    comment.hashCode),
                entryDate.hashCode),
            currencyCode.hashCode),
        balance.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Transaction')
          ..add('transactionId', transactionId)
          ..add('t', t)
          ..add('amount', amount)
          ..add('comment', comment)
          ..add('entryDate', entryDate)
          ..add('currencyCode', currencyCode)
          ..add('balance', balance))
        .toString();
  }
}

class TransactionBuilder implements Builder<Transaction, TransactionBuilder> {
  _$Transaction? _$v;

  int? _transactionId;
  int? get transactionId => _$this._transactionId;
  set transactionId(int? transactionId) =>
      _$this._transactionId = transactionId;

  String? _t;
  String? get t => _$this._t;
  set t(String? t) => _$this._t = t;

  double? _amount;
  double? get amount => _$this._amount;
  set amount(double? amount) => _$this._amount = amount;

  String? _comment;
  String? get comment => _$this._comment;
  set comment(String? comment) => _$this._comment = comment;

  String? _entryDate;
  String? get entryDate => _$this._entryDate;
  set entryDate(String? entryDate) => _$this._entryDate = entryDate;

  String? _currencyCode;
  String? get currencyCode => _$this._currencyCode;
  set currencyCode(String? currencyCode) => _$this._currencyCode = currencyCode;

  String? _balance;
  String? get balance => _$this._balance;
  set balance(String? balance) => _$this._balance = balance;

  TransactionBuilder();

  TransactionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _transactionId = $v.transactionId;
      _t = $v.t;
      _amount = $v.amount;
      _comment = $v.comment;
      _entryDate = $v.entryDate;
      _currencyCode = $v.currencyCode;
      _balance = $v.balance;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Transaction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Transaction;
  }

  @override
  void update(void Function(TransactionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Transaction build() {
    final _$result = _$v ??
        new _$Transaction._(
            transactionId: BuiltValueNullFieldError.checkNotNull(
                transactionId, 'Transaction', 'transactionId'),
            t: BuiltValueNullFieldError.checkNotNull(t, 'Transaction', 't'),
            amount: BuiltValueNullFieldError.checkNotNull(
                amount, 'Transaction', 'amount'),
            comment: comment,
            entryDate: entryDate,
            currencyCode: BuiltValueNullFieldError.checkNotNull(
                currencyCode, 'Transaction', 'currencyCode'),
            balance: BuiltValueNullFieldError.checkNotNull(
                balance, 'Transaction', 'balance'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
