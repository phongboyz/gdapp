// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @HiveField(0)
  int? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get username => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get firstname => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get lastname => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get business => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get profile => throw _privateConstructorUsedError;
  @HiveField(6)
  String? get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@HiveField(0) int? id,
      @HiveField(1) String? username,
      @HiveField(2) String? firstname,
      @HiveField(3) String? lastname,
      @HiveField(4) String? business,
      @HiveField(5) String? profile,
      @HiveField(6) String? token});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? business = freezed,
    Object? profile = freezed,
    Object? token = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      firstname: freezed == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String?,
      lastname: freezed == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String?,
      business: freezed == business
          ? _value.business
          : business // ignore: cast_nullable_to_non_nullable
              as String?,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int? id,
      @HiveField(1) String? username,
      @HiveField(2) String? firstname,
      @HiveField(3) String? lastname,
      @HiveField(4) String? business,
      @HiveField(5) String? profile,
      @HiveField(6) String? token});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? firstname = freezed,
    Object? lastname = freezed,
    Object? business = freezed,
    Object? profile = freezed,
    Object? token = freezed,
  }) {
    return _then(_$UserImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      firstname: freezed == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String?,
      lastname: freezed == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String?,
      business: freezed == business
          ? _value.business
          : business // ignore: cast_nullable_to_non_nullable
              as String?,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {@HiveField(0) this.id,
      @HiveField(1) this.username,
      @HiveField(2) this.firstname,
      @HiveField(3) this.lastname,
      @HiveField(4) this.business,
      @HiveField(5) this.profile,
      @HiveField(6) this.token});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  @HiveField(0)
  final int? id;
  @override
  @HiveField(1)
  final String? username;
  @override
  @HiveField(2)
  final String? firstname;
  @override
  @HiveField(3)
  final String? lastname;
  @override
  @HiveField(4)
  final String? business;
  @override
  @HiveField(5)
  final String? profile;
  @override
  @HiveField(6)
  final String? token;

  @override
  String toString() {
    return 'User(id: $id, username: $username, firstname: $firstname, lastname: $lastname, business: $business, profile: $profile, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.business, business) ||
                other.business == business) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, username, firstname, lastname, business, profile, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {@HiveField(0) final int? id,
      @HiveField(1) final String? username,
      @HiveField(2) final String? firstname,
      @HiveField(3) final String? lastname,
      @HiveField(4) final String? business,
      @HiveField(5) final String? profile,
      @HiveField(6) final String? token}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  @HiveField(0)
  int? get id;
  @override
  @HiveField(1)
  String? get username;
  @override
  @HiveField(2)
  String? get firstname;
  @override
  @HiveField(3)
  String? get lastname;
  @override
  @HiveField(4)
  String? get business;
  @override
  @HiveField(5)
  String? get profile;
  @override
  @HiveField(6)
  String? get token;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
