// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sell_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SellDetail _$SellDetailFromJson(Map<String, dynamic> json) {
  return _SellDetail.fromJson(json);
}

/// @nodoc
mixin _$SellDetail {
  int? get product_id => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  int? get qty => throw _privateConstructorUsedError;
  int? get discount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SellDetailCopyWith<SellDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellDetailCopyWith<$Res> {
  factory $SellDetailCopyWith(
          SellDetail value, $Res Function(SellDetail) then) =
      _$SellDetailCopyWithImpl<$Res, SellDetail>;
  @useResult
  $Res call({int? product_id, double? price, int? qty, int? discount});
}

/// @nodoc
class _$SellDetailCopyWithImpl<$Res, $Val extends SellDetail>
    implements $SellDetailCopyWith<$Res> {
  _$SellDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product_id = freezed,
    Object? price = freezed,
    Object? qty = freezed,
    Object? discount = freezed,
  }) {
    return _then(_value.copyWith(
      product_id: freezed == product_id
          ? _value.product_id
          : product_id // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      qty: freezed == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SellDetailImplCopyWith<$Res>
    implements $SellDetailCopyWith<$Res> {
  factory _$$SellDetailImplCopyWith(
          _$SellDetailImpl value, $Res Function(_$SellDetailImpl) then) =
      __$$SellDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? product_id, double? price, int? qty, int? discount});
}

/// @nodoc
class __$$SellDetailImplCopyWithImpl<$Res>
    extends _$SellDetailCopyWithImpl<$Res, _$SellDetailImpl>
    implements _$$SellDetailImplCopyWith<$Res> {
  __$$SellDetailImplCopyWithImpl(
      _$SellDetailImpl _value, $Res Function(_$SellDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product_id = freezed,
    Object? price = freezed,
    Object? qty = freezed,
    Object? discount = freezed,
  }) {
    return _then(_$SellDetailImpl(
      product_id: freezed == product_id
          ? _value.product_id
          : product_id // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      qty: freezed == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SellDetailImpl implements _SellDetail {
  const _$SellDetailImpl(
      {this.product_id, this.price, this.qty, this.discount});

  factory _$SellDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$SellDetailImplFromJson(json);

  @override
  final int? product_id;
  @override
  final double? price;
  @override
  final int? qty;
  @override
  final int? discount;

  @override
  String toString() {
    return 'SellDetail(product_id: $product_id, price: $price, qty: $qty, discount: $discount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SellDetailImpl &&
            (identical(other.product_id, product_id) ||
                other.product_id == product_id) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.discount, discount) ||
                other.discount == discount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, product_id, price, qty, discount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SellDetailImplCopyWith<_$SellDetailImpl> get copyWith =>
      __$$SellDetailImplCopyWithImpl<_$SellDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SellDetailImplToJson(
      this,
    );
  }
}

abstract class _SellDetail implements SellDetail {
  const factory _SellDetail(
      {final int? product_id,
      final double? price,
      final int? qty,
      final int? discount}) = _$SellDetailImpl;

  factory _SellDetail.fromJson(Map<String, dynamic> json) =
      _$SellDetailImpl.fromJson;

  @override
  int? get product_id;
  @override
  double? get price;
  @override
  int? get qty;
  @override
  int? get discount;
  @override
  @JsonKey(ignore: true)
  _$$SellDetailImplCopyWith<_$SellDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
