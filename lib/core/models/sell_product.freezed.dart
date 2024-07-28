// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sell_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SellProduct _$SellProductFromJson(Map<String, dynamic> json) {
  return _SellProduct.fromJson(json);
}

/// @nodoc
mixin _$SellProduct {
  String? get contact_id => throw _privateConstructorUsedError;
  String? get billno => throw _privateConstructorUsedError;
  String? get amount => throw _privateConstructorUsedError;
  String? get details => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SellProductCopyWith<SellProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellProductCopyWith<$Res> {
  factory $SellProductCopyWith(
          SellProduct value, $Res Function(SellProduct) then) =
      _$SellProductCopyWithImpl<$Res, SellProduct>;
  @useResult
  $Res call(
      {String? contact_id, String? billno, String? amount, String? details});
}

/// @nodoc
class _$SellProductCopyWithImpl<$Res, $Val extends SellProduct>
    implements $SellProductCopyWith<$Res> {
  _$SellProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contact_id = freezed,
    Object? billno = freezed,
    Object? amount = freezed,
    Object? details = freezed,
  }) {
    return _then(_value.copyWith(
      contact_id: freezed == contact_id
          ? _value.contact_id
          : contact_id // ignore: cast_nullable_to_non_nullable
              as String?,
      billno: freezed == billno
          ? _value.billno
          : billno // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SellProductImplCopyWith<$Res>
    implements $SellProductCopyWith<$Res> {
  factory _$$SellProductImplCopyWith(
          _$SellProductImpl value, $Res Function(_$SellProductImpl) then) =
      __$$SellProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? contact_id, String? billno, String? amount, String? details});
}

/// @nodoc
class __$$SellProductImplCopyWithImpl<$Res>
    extends _$SellProductCopyWithImpl<$Res, _$SellProductImpl>
    implements _$$SellProductImplCopyWith<$Res> {
  __$$SellProductImplCopyWithImpl(
      _$SellProductImpl _value, $Res Function(_$SellProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contact_id = freezed,
    Object? billno = freezed,
    Object? amount = freezed,
    Object? details = freezed,
  }) {
    return _then(_$SellProductImpl(
      contact_id: freezed == contact_id
          ? _value.contact_id
          : contact_id // ignore: cast_nullable_to_non_nullable
              as String?,
      billno: freezed == billno
          ? _value.billno
          : billno // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SellProductImpl implements _SellProduct {
  const _$SellProductImpl(
      {this.contact_id, this.billno, this.amount, this.details});

  factory _$SellProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$SellProductImplFromJson(json);

  @override
  final String? contact_id;
  @override
  final String? billno;
  @override
  final String? amount;
  @override
  final String? details;

  @override
  String toString() {
    return 'SellProduct(contact_id: $contact_id, billno: $billno, amount: $amount, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SellProductImpl &&
            (identical(other.contact_id, contact_id) ||
                other.contact_id == contact_id) &&
            (identical(other.billno, billno) || other.billno == billno) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.details, details) || other.details == details));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, contact_id, billno, amount, details);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SellProductImplCopyWith<_$SellProductImpl> get copyWith =>
      __$$SellProductImplCopyWithImpl<_$SellProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SellProductImplToJson(
      this,
    );
  }
}

abstract class _SellProduct implements SellProduct {
  const factory _SellProduct(
      {final String? contact_id,
      final String? billno,
      final String? amount,
      final String? details}) = _$SellProductImpl;

  factory _SellProduct.fromJson(Map<String, dynamic> json) =
      _$SellProductImpl.fromJson;

  @override
  String? get contact_id;
  @override
  String? get billno;
  @override
  String? get amount;
  @override
  String? get details;
  @override
  @JsonKey(ignore: true)
  _$$SellProductImplCopyWith<_$SellProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
