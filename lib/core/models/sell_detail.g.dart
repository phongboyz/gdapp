// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sell_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SellDetailImpl _$$SellDetailImplFromJson(Map<String, dynamic> json) =>
    _$SellDetailImpl(
      product_id: (json['product_id'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toDouble(),
      qty: (json['qty'] as num?)?.toInt(),
      discount: (json['discount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SellDetailImplToJson(_$SellDetailImpl instance) =>
    <String, dynamic>{
      'product_id': instance.product_id,
      'price': instance.price,
      'qty': instance.qty,
      'discount': instance.discount,
    };
