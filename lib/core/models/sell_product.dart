import 'package:freezed_annotation/freezed_annotation.dart';
part 'sell_product.freezed.dart';
part 'sell_product.g.dart';

@freezed
class SellProduct with _$SellProduct {
  const factory SellProduct({
    String? contact_id,
    String? billno,
    String? amount,
    String? details,
  }) = _SellProduct;

  factory SellProduct.fromJson(Map<String, dynamic> json) =>
      _$SellProductFromJson(json);
}
