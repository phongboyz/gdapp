// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MemberListAdapter extends TypeAdapter<MemberList> {
  @override
  final int typeId = 4;

  @override
  MemberList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MemberList(
      name: fields[0] as String?,
      first_name: fields[1] as String?,
      contact_id: fields[2] as int?,
      city: fields[3] as String?,
      state: fields[4] as String?,
      country: fields[5] as String?,
      mobile: fields[6] as String?,
      id: fields[7] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, MemberList obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.first_name)
      ..writeByte(2)
      ..write(obj.contact_id)
      ..writeByte(3)
      ..write(obj.city)
      ..writeByte(4)
      ..write(obj.state)
      ..writeByte(5)
      ..write(obj.country)
      ..writeByte(6)
      ..write(obj.mobile)
      ..writeByte(7)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MemberListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemberListImpl _$$MemberListImplFromJson(Map<String, dynamic> json) =>
    _$MemberListImpl(
      name: json['name'] as String?,
      first_name: json['first_name'] as String?,
      contact_id: (json['contact_id'] as num?)?.toInt(),
      city: json['city'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      mobile: json['mobile'] as String?,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MemberListImplToJson(_$MemberListImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'first_name': instance.first_name,
      'contact_id': instance.contact_id,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'mobile': instance.mobile,
      'id': instance.id,
    };
