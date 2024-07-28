import 'package:freezed_annotation/freezed_annotation.dart';
part 'sell_detail.freezed.dart';
part 'sell_detail.g.dart';

@freezed
class SellDetail with _$SellDetail {
  const factory SellDetail({
    int? product_id,
    double? price,
    int? qty,
    int? discount,
  }) = _SellDetail;

  factory SellDetail.fromJson(Map<String, dynamic> json) =>
      _$SellDetailFromJson(json);
}
