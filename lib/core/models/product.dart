import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gd/core/models/product_items.dart';
part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
   List<ProductItems>? data,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}
