import 'package:dartz/dartz.dart';
import 'package:gd/core/error/failures.dart';
import 'package:gd/core/models/bill.dart';
import 'package:gd/core/models/sell_product.dart';
import 'package:gd/core/usecases/usecase.dart';
import 'package:gd/features/sale/domain/repository/sale_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SellProductUsecase implements UseCase<Bill, SellProduct> {
  final SaleRepository _repository;
  SellProductUsecase(this._repository);

  @override
  Future<Either<Failure, Bill>> call(SellProduct data) async {
    return await _repository.sellProduct(sellProduct: data);
  }
}
