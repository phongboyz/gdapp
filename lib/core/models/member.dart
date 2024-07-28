import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gd/core/models/member_list.dart';
part 'member.freezed.dart';
part 'member.g.dart';

@freezed
class Member with _$Member {
  const factory Member({
   List<MemberList>? data,
  }) = _Product;

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);
}
