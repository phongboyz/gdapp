// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_items.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductItemsAdapter extends TypeAdapter<ProductItems> {
  @override
  final int typeId = 2;

  @override
  ProductItems read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductItems(
      id: fields[0] as int?,
      name: fields[1] as String?,
      image: fields[2] as String?,
      alert_quantity: fields[3] as String?,
      sku: fields[4] as int?,
      default_sell_price: fields[5] as String?,
      image_url: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductItems obj) {
    writer
      ..writeByte(7)
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
      ..write(obj.image_url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductItemsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductItemsImpl _$$ProductItemsImplFromJson(Map<String, dynamic> json) =>
    _$ProductItemsImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      image: json['image'] as String?,
      alert_quantity: json['alert_quantity'] as String?,
      sku: (json['sku'] as num?)?.toInt(),
      default_sell_price: json['default_sell_price'] as String?,
      image_url: json['image_url'] as String?,
    );

Map<String, dynamic> _$$ProductItemsImplToJson(_$ProductItemsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'alert_quantity': instance.alert_quantity,
      'sku': instance.sku,
      'default_sell_price': instance.default_sell_price,
      'image_url': instance.image_url,
    };
