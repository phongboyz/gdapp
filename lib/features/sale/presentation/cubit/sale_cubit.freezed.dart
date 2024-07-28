// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sale_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SaleState {
  DataStatus get status => throw _privateConstructorUsedError;
  List<Cart>? get product => throw _privateConstructorUsedError;
  Member? get member => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  double? get total => throw _privateConstructorUsedError;
  int? get length => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get seller => throw _privateConstructorUsedError;
  Bill? get bill => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SaleStateCopyWith<SaleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaleStateCopyWith<$Res> {
  factory $SaleStateCopyWith(SaleState value, $Res Function(SaleState) then) =
      _$SaleStateCopyWithImpl<$Res, SaleState>;
  @useResult
  $Res call(
      {DataStatus status,
      List<Cart>? product,
      Member? member,
      String? error,
      double? total,
      int? length,
      String? message,
      String? seller,
      Bill? bill});

  $MemberCopyWith<$Res>? get member;
  $BillCopyWith<$Res>? get bill;
}

/// @nodoc
class _$SaleStateCopyWithImpl<$Res, $Val extends SaleState>
    implements $SaleStateCopyWith<$Res> {
  _$SaleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? product = freezed,
    Object? member = freezed,
    Object? error = freezed,
    Object? total = freezed,
    Object? length = freezed,
    Object? message = freezed,
    Object? seller = freezed,
    Object? bill = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStatus,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as List<Cart>?,
      member: freezed == member
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as Member?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
      length: freezed == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      seller: freezed == seller
          ? _value.seller
          : seller // ignore: cast_nullable_to_non_nullable
              as String?,
      bill: freezed == bill
          ? _value.bill
          : bill // ignore: cast_nullable_to_non_nullable
              as Bill?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MemberCopyWith<$Res>? get member {
    if (_value.member == null) {
      return null;
    }

    return $MemberCopyWith<$Res>(_value.member!, (value) {
      return _then(_value.copyWith(member: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BillCopyWith<$Res>? get bill {
    if (_value.bill == null) {
      return null;
    }

    return $BillCopyWith<$Res>(_value.bill!, (value) {
      return _then(_value.copyWith(bill: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $SaleStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DataStatus status,
      List<Cart>? product,
      Member? member,
      String? error,
      double? total,
      int? length,
      String? message,
      String? seller,
      Bill? bill});

  @override
  $MemberCopyWith<$Res>? get member;
  @override
  $BillCopyWith<$Res>? get bill;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$SaleStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? product = freezed,
    Object? member = freezed,
    Object? error = freezed,
    Object? total = freezed,
    Object? length = freezed,
    Object? message = freezed,
    Object? seller = freezed,
    Object? bill = freezed,
  }) {
    return _then(_$InitialImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStatus,
      product: freezed == product
          ? _value._product
          : product // ignore: cast_nullable_to_non_nullable
              as List<Cart>?,
      member: freezed == member
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as Member?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
      length: freezed == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      seller: freezed == seller
          ? _value.seller
          : seller // ignore: cast_nullable_to_non_nullable
              as String?,
      bill: freezed == bill
          ? _value.bill
          : bill // ignore: cast_nullable_to_non_nullable
              as Bill?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.status = DataStatus.initial,
      final List<Cart>? product,
      this.member,
      this.error,
      this.total,
      this.length,
      this.message,
      this.seller,
      this.bill})
      : _product = product;

  @override
  @JsonKey()
  final DataStatus status;
  final List<Cart>? _product;
  @override
  List<Cart>? get product {
    final value = _product;
    if (value == null) return null;
    if (_product is EqualUnmodifiableListView) return _product;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Member? member;
  @override
  final String? error;
  @override
  final double? total;
  @override
  final int? length;
  @override
  final String? message;
  @override
  final String? seller;
  @override
  final Bill? bill;

  @override
  String toString() {
    return 'SaleState(status: $status, product: $product, member: $member, error: $error, total: $total, length: $length, message: $message, seller: $seller, bill: $bill)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._product, _product) &&
            (identical(other.member, member) || other.member == member) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.length, length) || other.length == length) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.seller, seller) || other.seller == seller) &&
            (identical(other.bill, bill) || other.bill == bill));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_product),
      member,
      error,
      total,
      length,
      message,
      seller,
      bill);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements SaleState {
  const factory _Initial(
      {final DataStatus status,
      final List<Cart>? product,
      final Member? member,
      final String? error,
      final double? total,
      final int? length,
      final String? message,
      final String? seller,
      final Bill? bill}) = _$InitialImpl;

  @override
  DataStatus get status;
  @override
  List<Cart>? get product;
  @override
  Member? get member;
  @override
  String? get error;
  @override
  double? get total;
  @override
  int? get length;
  @override
  String? get message;
  @override
  String? get seller;
  @override
  Bill? get bill;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
