// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bill.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Bill _$BillFromJson(Map<String, dynamic> json) {
  return _Bill.fromJson(json);
}

/// @nodoc
mixin _$Bill {
  String? get transaction_date => throw _privateConstructorUsedError;
  String? get invoice_no => throw _privateConstructorUsedError;
  String? get created_at => throw _privateConstructorUsedError;
  String? get customer => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  List<dynamic>? get product => throw _privateConstructorUsedError;
  String? get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BillCopyWith<Bill> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillCopyWith<$Res> {
  factory $BillCopyWith(Bill value, $Res Function(Bill) then) =
      _$BillCopyWithImpl<$Res, Bill>;
  @useResult
  $Res call(
      {String? transaction_date,
      String? invoice_no,
      String? created_at,
      String? customer,
      String? address,
      List<dynamic>? product,
      String? total});
}

/// @nodoc
class _$BillCopyWithImpl<$Res, $Val extends Bill>
    implements $BillCopyWith<$Res> {
  _$BillCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transaction_date = freezed,
    Object? invoice_no = freezed,
    Object? created_at = freezed,
    Object? customer = freezed,
    Object? address = freezed,
    Object? product = freezed,
    Object? total = freezed,
  }) {
    return _then(_value.copyWith(
      transaction_date: freezed == transaction_date
          ? _value.transaction_date
          : transaction_date // ignore: cast_nullable_to_non_nullable
              as String?,
      invoice_no: freezed == invoice_no
          ? _value.invoice_no
          : invoice_no // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String?,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BillImplCopyWith<$Res> implements $BillCopyWith<$Res> {
  factory _$$BillImplCopyWith(
          _$BillImpl value, $Res Function(_$BillImpl) then) =
      __$$BillImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? transaction_date,
      String? invoice_no,
      String? created_at,
      String? customer,
      String? address,
      List<dynamic>? product,
      String? total});
}

/// @nodoc
class __$$BillImplCopyWithImpl<$Res>
    extends _$BillCopyWithImpl<$Res, _$BillImpl>
    implements _$$BillImplCopyWith<$Res> {
  __$$BillImplCopyWithImpl(_$BillImpl _value, $Res Function(_$BillImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transaction_date = freezed,
    Object? invoice_no = freezed,
    Object? created_at = freezed,
    Object? customer = freezed,
    Object? address = freezed,
    Object? product = freezed,
    Object? total = freezed,
  }) {
    return _then(_$BillImpl(
      transaction_date: freezed == transaction_date
          ? _value.transaction_date
          : transaction_date // ignore: cast_nullable_to_non_nullable
              as String?,
      invoice_no: freezed == invoice_no
          ? _value.invoice_no
          : invoice_no // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String?,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      product: freezed == product
          ? _value._product
          : product // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BillImpl implements _Bill {
  const _$BillImpl(
      {this.transaction_date,
      this.invoice_no,
      this.created_at,
      this.customer,
      this.address,
      final List<dynamic>? product,
      this.total})
      : _product = product;

  factory _$BillImpl.fromJson(Map<String, dynamic> json) =>
      _$$BillImplFromJson(json);

  @override
  final String? transaction_date;
  @override
  final String? invoice_no;
  @override
  final String? created_at;
  @override
  final String? customer;
  @override
  final String? address;
  final List<dynamic>? _product;
  @override
  List<dynamic>? get product {
    final value = _product;
    if (value == null) return null;
    if (_product is EqualUnmodifiableListView) return _product;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? total;

  @override
  String toString() {
    return 'Bill(transaction_date: $transaction_date, invoice_no: $invoice_no, created_at: $created_at, customer: $customer, address: $address, product: $product, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BillImpl &&
            (identical(other.transaction_date, transaction_date) ||
                other.transaction_date == transaction_date) &&
            (identical(other.invoice_no, invoice_no) ||
                other.invoice_no == invoice_no) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality().equals(other._product, _product) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      transaction_date,
      invoice_no,
      created_at,
      customer,
      address,
      const DeepCollectionEquality().hash(_product),
      total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BillImplCopyWith<_$BillImpl> get copyWith =>
      __$$BillImplCopyWithImpl<_$BillImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BillImplToJson(
      this,
    );
  }
}

abstract class _Bill implements Bill {
  const factory _Bill(
      {final String? transaction_date,
      final String? invoice_no,
      final String? created_at,
      final String? customer,
      final String? address,
      final List<dynamic>? product,
      final String? total}) = _$BillImpl;

  factory _Bill.fromJson(Map<String, dynamic> json) = _$BillImpl.fromJson;

  @override
  String? get transaction_date;
  @override
  String? get invoice_no;
  @override
  String? get created_at;
  @override
  String? get customer;
  @override
  String? get address;
  @override
  List<dynamic>? get product;
  @override
  String? get total;
  @override
  @JsonKey(ignore: true)
  _$$BillImplCopyWith<_$BillImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
