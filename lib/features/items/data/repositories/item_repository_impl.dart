import 'package:dartz/dartz.dart';
import 'package:gd/core/error/exceptions.dart';
import 'package:gd/core/error/failures.dart';
import 'package:gd/core/models/product.dart';
import 'package:gd/features/items/data/datasources/item_remote_datasource.dart';
import 'package:gd/features/items/domain/repository/item_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ItemRepository)
class ItemRepositoryImpl implements ItemRepository {
  final ItemRemoteDataSource _itemRemotDatasource;
  ItemRepositoryImpl( this._itemRemotDatasource);

  @override
  Future<Either<Failure, Product>> getProduct({required String productData}) async {
       try {
      return Right((await _itemRemotDatasource.searchProduct(productData: productData)));
    } on CacheException catch (e) {
      return Left(CachedFailure(e.msg));
    } catch (e) {
      return Left(CachedFailure(e.toString()));
    }
  }
}
