import 'package:dartz/dartz.dart';
import 'package:gd/core/models/product.dart';
import '../../../../core/error/failures.dart';

abstract class ItemRepository {
  Future<Either<Failure,Product>>getProduct({required String productData});
}
