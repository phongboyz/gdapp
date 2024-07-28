import 'package:dartz/dartz.dart';
import 'package:gd/core/error/failures.dart';
import 'package:gd/core/models/cart.dart';
import 'package:gd/core/usecases/no_params.dart';
import 'package:gd/core/usecases/usecase.dart';
import 'package:gd/features/sale/domain/repository/sale_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetProductItemsUsecase implements UseCase<List<Cart>, NoParams> {
  final SaleRepository _repository;
  GetProductItemsUsecase(this._repository);

  @override
  Future<Either<Failure, List<Cart>>> call(NoParams noParams) async {
    return await _repository.getProductItems();
  }
}
