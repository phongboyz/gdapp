import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
@HiveType(typeId: 3)
class Cart with _$Cart {
  const factory Cart({
    @HiveField(0) int? id,
    @HiveField(1) String? name,
    @HiveField(2) String? image,
    @HiveField(3) String? alert_quantity,
    @HiveField(4) String? sku,
    @HiveField(5) String? default_sell_price,
    @HiveField(6) String? image_url,
    @HiveField(7) int? amount,
    @HiveField(8) String? total,
    @HiveField(9) String? key,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}
