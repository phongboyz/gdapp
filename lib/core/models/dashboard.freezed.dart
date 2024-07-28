// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Dashboard _$DashboardFromJson(Map<String, dynamic> json) {
  return _Dashboard.fromJson(json);
}

/// @nodoc
mixin _$Dashboard {
  int? get data_purchase => throw _privateConstructorUsedError;
  int? get data_sell => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DashboardCopyWith<Dashboard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardCopyWith<$Res> {
  factory $DashboardCopyWith(Dashboard value, $Res Function(Dashboard) then) =
      _$DashboardCopyWithImpl<$Res, Dashboard>;
  @useResult
  $Res call({int? data_purchase, int? data_sell});
}

/// @nodoc
class _$DashboardCopyWithImpl<$Res, $Val extends Dashboard>
    implements $DashboardCopyWith<$Res> {
  _$DashboardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data_purchase = freezed,
    Object? data_sell = freezed,
  }) {
    return _then(_value.copyWith(
      data_purchase: freezed == data_purchase
          ? _value.data_purchase
          : data_purchase // ignore: cast_nullable_to_non_nullable
              as int?,
      data_sell: freezed == data_sell
          ? _value.data_sell
          : data_sell // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashboardImplCopyWith<$Res>
    implements $DashboardCopyWith<$Res> {
  factory _$$DashboardImplCopyWith(
          _$DashboardImpl value, $Res Function(_$DashboardImpl) then) =
      __$$DashboardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? data_purchase, int? data_sell});
}

/// @nodoc
class __$$DashboardImplCopyWithImpl<$Res>
    extends _$DashboardCopyWithImpl<$Res, _$DashboardImpl>
    implements _$$DashboardImplCopyWith<$Res> {
  __$$DashboardImplCopyWithImpl(
      _$DashboardImpl _value, $Res Function(_$DashboardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data_purchase = freezed,
    Object? data_sell = freezed,
  }) {
    return _then(_$DashboardImpl(
      data_purchase: freezed == data_purchase
          ? _value.data_purchase
          : data_purchase // ignore: cast_nullable_to_non_nullable
              as int?,
      data_sell: freezed == data_sell
          ? _value.data_sell
          : data_sell // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardImpl implements _Dashboard {
  const _$DashboardImpl({this.data_purchase, this.data_sell});

  factory _$DashboardImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardImplFromJson(json);

  @override
  final int? data_purchase;
  @override
  final int? data_sell;

  @override
  String toString() {
    return 'Dashboard(data_purchase: $data_purchase, data_sell: $data_sell)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardImpl &&
            (identical(other.data_purchase, data_purchase) ||
                other.data_purchase == data_purchase) &&
            (identical(other.data_sell, data_sell) ||
                other.data_sell == data_sell));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data_purchase, data_sell);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardImplCopyWith<_$DashboardImpl> get copyWith =>
      __$$DashboardImplCopyWithImpl<_$DashboardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardImplToJson(
      this,
    );
  }
}

abstract class _Dashboard implements Dashboard {
  const factory _Dashboard({final int? data_purchase, final int? data_sell}) =
      _$DashboardImpl;

  factory _Dashboard.fromJson(Map<String, dynamic> json) =
      _$DashboardImpl.fromJson;

  @override
  int? get data_purchase;
  @override
  int? get data_sell;
  @override
  @JsonKey(ignore: true)
  _$$DashboardImplCopyWith<_$DashboardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
