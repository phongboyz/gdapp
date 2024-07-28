// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sell_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SellProductImpl _$$SellProductImplFromJson(Map<String, dynamic> json) =>
    _$SellProductImpl(
      contact_id: json['contact_id'] as String?,
      billno: json['billno'] as String?,
      amount: json['amount'] as String?,
      details: json['details'] as String?,
    );

Map<String, dynamic> _$$SellProductImplToJson(_$SellProductImpl instance) =>
    <String, dynamic>{
      'contact_id': instance.contact_id,
      'billno': instance.billno,
      'amount': instance.amount,
      'details': instance.details,
    };
