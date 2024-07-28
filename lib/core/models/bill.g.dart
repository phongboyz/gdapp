// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BillImpl _$$BillImplFromJson(Map<String, dynamic> json) => _$BillImpl(
      transaction_date: json['transaction_date'] as String?,
      invoice_no: json['invoice_no'] as String?,
      created_at: json['created_at'] as String?,
      customer: json['customer'] as String?,
      address: json['address'] as String?,
      product: json['product'] as List<dynamic>?,
      total: json['total'] as String?,
    );

Map<String, dynamic> _$$BillImplToJson(_$BillImpl instance) =>
    <String, dynamic>{
      'transaction_date': instance.transaction_date,
      'invoice_no': instance.invoice_no,
      'created_at': instance.created_at,
      'customer': instance.customer,
      'address': instance.address,
      'product': instance.product,
      'total': instance.total,
    };
