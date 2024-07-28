// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DashboardState {
  DataStatus get status => throw _privateConstructorUsedError;
  Dashboard? get dashboard => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  int? get length => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DashboardStateCopyWith<DashboardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardStateCopyWith<$Res> {
  factory $DashboardStateCopyWith(
          DashboardState value, $Res Function(DashboardState) then) =
      _$DashboardStateCopyWithImpl<$Res, DashboardState>;
  @useResult
  $Res call(
      {DataStatus status, Dashboard? dashboard, String? error, int? length});

  $DashboardCopyWith<$Res>? get dashboard;
}

/// @nodoc
class _$DashboardStateCopyWithImpl<$Res, $Val extends DashboardState>
    implements $DashboardStateCopyWith<$Res> {
  _$DashboardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? dashboard = freezed,
    Object? error = freezed,
    Object? length = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStatus,
      dashboard: freezed == dashboard
          ? _value.dashboard
          : dashboard // ignore: cast_nullable_to_non_nullable
              as Dashboard?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      length: freezed == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DashboardCopyWith<$Res>? get dashboard {
    if (_value.dashboard == null) {
      return null;
    }

    return $DashboardCopyWith<$Res>(_value.dashboard!, (value) {
      return _then(_value.copyWith(dashboard: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $DashboardStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DataStatus status, Dashboard? dashboard, String? error, int? length});

  @override
  $DashboardCopyWith<$Res>? get dashboard;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? dashboard = freezed,
    Object? error = freezed,
    Object? length = freezed,
  }) {
    return _then(_$InitialImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStatus,
      dashboard: freezed == dashboard
          ? _value.dashboard
          : dashboard // ignore: cast_nullable_to_non_nullable
              as Dashboard?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      length: freezed == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.status = DataStatus.initial,
      this.dashboard,
      this.error,
      this.length});

  @override
  @JsonKey()
  final DataStatus status;
  @override
  final Dashboard? dashboard;
  @override
  final String? error;
  @override
  final int? length;

  @override
  String toString() {
    return 'DashboardState(status: $status, dashboard: $dashboard, error: $error, length: $length)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.dashboard, dashboard) ||
                other.dashboard == dashboard) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.length, length) || other.length == length));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, dashboard, error, length);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements DashboardState {
  const factory _Initial(
      {final DataStatus status,
      final Dashboard? dashboard,
      final String? error,
      final int? length}) = _$InitialImpl;

  @override
  DataStatus get status;
  @override
  Dashboard? get dashboard;
  @override
  String? get error;
  @override
  int? get length;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
