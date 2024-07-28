import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
@HiveType(typeId: 1)
class User with _$User {
  const factory User({
    @HiveField(0) int? id,
    @HiveField(1) String? username,
    @HiveField(2) String? firstname,
    @HiveField(3) String? lastname,
    @HiveField(4) String? business,
    @HiveField(5) String? profile,
    @HiveField(6) String? token,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
