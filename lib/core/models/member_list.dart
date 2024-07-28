import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'member_list.freezed.dart';
part 'member_list.g.dart';

@freezed
@HiveType(typeId: 4)
class MemberList with _$MemberList {
  const factory MemberList({
    @HiveField(0) String? name,
    @HiveField(1) String? first_name,
    @HiveField(2) int? contact_id,
    @HiveField(3) String? city,
    @HiveField(4) String? state,
    @HiveField(5) String? country,
    @HiveField(6) String? mobile,
    @HiveField(7) int? id,
  }) = _MemberList;

  factory MemberList.fromJson(Map<String, dynamic> json) =>
      _$MemberListFromJson(json);
}
