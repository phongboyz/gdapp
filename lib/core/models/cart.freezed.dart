// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Cart _$CartFromJson(Map<String, dynamic> json) {
  return _Cart.fromJson(json);
}

/// @nodoc
mixin _$Cart {
  @HiveField(0)
  int? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get image => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get alert_quantity => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get sku => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get default_sell_price => throw _privateConstructorUsedError;
  @HiveField(6)
  String? get image_url => throw _privateConstructorUsedError;
  @HiveField(7)
  int? get amount => throw _privateConstructorUsedError;
  @HiveField(8)
  String? get total => throw _privateConstructorUsedError;
  @HiveField(9)
  String? get key => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartCopyWith<Cart> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartCopyWith<$Res> {
  factory $CartCopyWith(Cart value, $Res Function(Cart) then) =
      _$CartCopyWithImpl<$Res, Cart>;
  @useResult
  $Res call(
      {@HiveField(0) int? id,
      @HiveField(1) String? name,
      @HiveField(2) String? image,
      @HiveField(3) String? alert_quantity,
      @HiveField(4) String? sku,
      @HiveField(5) String? default_sell_price,
      @HiveField(6) String? image_url,
      @HiveField(7) int? amount,
      @HiveField(8) String? total,
      @HiveField(9) String? key});
}

/// @nodoc
class _$CartCopyWithImpl<$Res, $Val extends Cart>
    implements $CartCopyWith<$Res> {
  _$CartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? image = freezed,
    Object? alert_quantity = freezed,
    Object? sku = freezed,
    Object? default_sell_price = freezed,
    Object? image_url = freezed,
    Object? amount = freezed,
    Object? total = freezed,
    Object? key = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      alert_quantity: freezed == alert_quantity
          ? _value.alert_quantity
          : alert_quantity // ignore: cast_nullable_to_non_nullable
              as String?,
      sku: freezed == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String?,
      default_sell_price: freezed == default_sell_price
          ? _value.default_sell_price
          : default_sell_price // ignore: cast_nullable_to_non_nullable
              as String?,
      image_url: freezed == image_url
          ? _value.image_url
          : image_url // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as String?,
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartImplCopyWith<$Res> implements $CartCopyWith<$Res> {
  factory _$$CartImplCopyWith(
          _$CartImpl value, $Res Function(_$CartImpl) then) =
      __$$CartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int? id,
      @HiveField(1) String? name,
      @HiveField(2) String? image,
      @HiveField(3) String? alert_quantity,
      @HiveField(4) String? sku,
      @HiveField(5) String? default_sell_price,
      @HiveField(6) String? image_url,
      @HiveField(7) int? amount,
      @HiveField(8) String? total,
      @HiveField(9) String? key});
}

/// @nodoc
class __$$CartImplCopyWithImpl<$Res>
    extends _$CartCopyWithImpl<$Res, _$CartImpl>
    implements _$$CartImplCopyWith<$Res> {
  __$$CartImplCopyWithImpl(_$CartImpl _value, $Res Function(_$CartImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? image = freezed,
    Object? alert_quantity = freezed,
    Object? sku = freezed,
    Object? default_sell_price = freezed,
    Object? image_url = freezed,
    Object? amount = freezed,
    Object? total = freezed,
    Object? key = freezed,
  }) {
    return _then(_$CartImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      alert_quantity: freezed == alert_quantity
          ? _value.alert_quantity
          : alert_quantity // ignore: cast_nullable_to_non_nullable
              as String?,
      sku: freezed == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String?,
      default_sell_price: freezed == default_sell_price
          ? _value.default_sell_price
          : default_sell_price // ignore: cast_nullable_to_non_nullable
              as String?,
      image_url: freezed == image_url
          ? _value.image_url
          : image_url // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as String?,
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartImpl implements _Cart {
  const _$CartImpl(
      {@HiveField(0) this.id,
      @HiveField(1) this.name,
      @HiveField(2) this.image,
      @HiveField(3) this.alert_quantity,
      @HiveField(4) this.sku,
      @HiveField(5) this.default_sell_price,
      @HiveField(6) this.image_url,
      @HiveField(7) this.amount,
      @HiveField(8) this.total,
      @HiveField(9) this.key});

  factory _$CartImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartImplFromJson(json);

  @override
  @HiveField(0)
  final int? id;
  @override
  @HiveField(1)
  final String? name;
  @override
  @HiveField(2)
  final String? image;
  @override
  @HiveField(3)
  final String? alert_quantity;
  @override
  @HiveField(4)
  final String? sku;
  @override
  @HiveField(5)
  final String? default_sell_price;
  @override
  @HiveField(6)
  final String? image_url;
  @override
  @HiveField(7)
  final int? amount;
  @override
  @HiveField(8)
  final String? total;
  @override
  @HiveField(9)
  final String? key;

  @override
  String toString() {
    return 'Cart(id: $id, name: $name, image: $image, alert_quantity: $alert_quantity, sku: $sku, default_sell_price: $default_sell_price, image_url: $image_url, amount: $amount, total: $total, key: $key)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.alert_quantity, alert_quantity) ||
                other.alert_quantity == alert_quantity) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.default_sell_price, default_sell_price) ||
                other.default_sell_price == default_sell_price) &&
            (identical(other.image_url, image_url) ||
                other.image_url == image_url) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.key, key) || other.key == key));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, image, alert_quantity,
      sku, default_sell_price, image_url, amount, total, key);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartImplCopyWith<_$CartImpl> get copyWith =>
      __$$CartImplCopyWithImpl<_$CartImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartImplToJson(
      this,
    );
  }
}

abstract class _Cart implements Cart {
  const factory _Cart(
      {@HiveField(0) final int? id,
      @HiveField(1) final String? name,
      @HiveField(2) final String? image,
      @HiveField(3) final String? alert_quantity,
      @HiveField(4) final String? sku,
      @HiveField(5) final String? default_sell_price,
      @HiveField(6) final String? image_url,
      @HiveField(7) final int? amount,
      @HiveField(8) final String? total,
      @HiveField(9) final String? key}) = _$CartImpl;

  factory _Cart.fromJson(Map<String, dynamic> json) = _$CartImpl.fromJson;

  @override
  @HiveField(0)
  int? get id;
  @override
  @HiveField(1)
  String? get name;
  @override
  @HiveField(2)
  String? get image;
  @override
  @HiveField(3)
  String? get alert_quantity;
  @override
  @HiveField(4)
  String? get sku;
  @override
  @HiveField(5)
  String? get default_sell_price;
  @override
  @HiveField(6)
  String? get image_url;
  @override
  @HiveField(7)
  int? get amount;
  @override
  @HiveField(8)
  String? get total;
  @override
  @HiveField(9)
  String? get key;
  @override
  @JsonKey(ignore: true)
  _$$CartImplCopyWith<_$CartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
