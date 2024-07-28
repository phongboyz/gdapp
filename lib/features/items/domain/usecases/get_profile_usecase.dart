import 'package:dartz/dartz.dart';
import 'package:gd/core/error/failures.dart';
import 'package:gd/core/models/product.dart';
import 'package:gd/core/usecases/usecase.dart';
import 'package:gd/features/items/domain/repository/item_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetProductUsecase implements UseCase<Product, String> {
  final ItemRepository _repository;
  GetProductUsecase(this._repository);

  @override
  Future<Either<Failure, Product>> call(String productData) async {
    return await _repository.getProduct(productData: productData);
  }
}
