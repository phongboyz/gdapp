import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'product_items.freezed.dart';
part 'product_items.g.dart';

@freezed
@HiveType(typeId: 2)
class ProductItems with _$ProductItems {
  const factory ProductItems({
    @HiveField(0) int? id,
    @HiveField(1) String? name,
    @HiveField(2) String? image,
    @HiveField(3) String? alert_quantity,
    @HiveField(4) int? sku,
    @HiveField(5) String? default_sell_price,
    @HiveField(6) String? image_url,
  }) = _ProductItems;

  factory ProductItems.fromJson(Map<String, dynamic> json) => _$ProductItemsFromJson(json);
}
