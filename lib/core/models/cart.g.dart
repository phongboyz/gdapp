// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartAdapter extends TypeAdapter<Cart> {
  @override
  final int typeId = 3;

  @override
  Cart read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Cart(
      id: fields[0] as int?,
      name: fields[1] as String?,
      image: fields[2] as String?,
      alert_quantity: fields[3] as String?,
      sku: fields[4] as String?,
      default_sell_price: fields[5] as String?,
      image_url: fields[6] as String?,
      amount: fields[7] as int?,
      total: fields[8] as String?,
      key: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Cart obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.alert_quantity)
      ..writeByte(4)
      ..write(obj.sku)
      ..writeByte(5)
      ..write(obj.default_sell_price)
      ..writeByte(6)
      ..write(obj.image_url)
      ..writeByte(7)
      ..write(obj.amount)
      ..writeByte(8)
      ..write(obj.total)
      ..writeByte(9)
      ..write(obj.key);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartImpl _$$CartImplFromJson(Map<String, dynamic> json) => _$CartImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      image: json['image'] as String?,
      alert_quantity: json['alert_quantity'] as String?,
      sku: json['sku'] as String?,
      default_sell_price: json['default_sell_price'] as String?,
      image_url: json['image_url'] as String?,
      amount: (json['amount'] as num?)?.toInt(),
      total: json['total'] as String?,
      key: json['key'] as String?,
    );

Map<String, dynamic> _$$CartImplToJson(_$CartImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'alert_quantity': instance.alert_quantity,
      'sku': instance.sku,
      'default_sell_price': instance.default_sell_price,
      'image_url': instance.image_url,
      'amount': instance.amount,
      'total': instance.total,
      'key': instance.key,
    };
