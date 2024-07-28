import 'package:dartz/dartz.dart';
import 'package:gd/core/error/exceptions.dart';
import 'package:gd/core/error/failures.dart';
import 'package:gd/core/models/bill.dart';
import 'package:gd/core/models/cart.dart';
import 'package:gd/core/models/member.dart';
import 'package:gd/core/models/sell_product.dart';
import 'package:gd/features/sale/data/datasources/sale_local_datasource.dart';
import 'package:gd/features/sale/data/datasources/sale_remote_datasource.dart';
import 'package:gd/features/sale/domain/repository/sale_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SaleRepository)
class SaleRepositoryImpl implements SaleRepository {
  final SaleLocalDataSource _saleLocalDatasource;
  final SaleRemoteDataSource _saleRemoteDatasource;
  SaleRepositoryImpl( this._saleLocalDatasource, this._saleRemoteDatasource);

  @override
  Future<Either<Failure, List<Cart>>> getProductItems() async {
       try {
      return Right((await _saleLocalDatasource.getProductItems()));
    } on CacheException catch (e) {
      return Left(CachedFailure(e.msg));
    } catch (e) {
      return Left(CachedFailure(e.toString()));
    }
  }
  @override
  Future<Either<Failure, Member>> getMember({required String memberData}) async {
       try {
      return Right(await _saleRemoteDatasource.searchMember(memberData: memberData));
    } on CacheException catch (e) {
      return Left(CachedFailure(e.msg));
    } catch (e) {
      return Left(CachedFailure(e.toString()));
    }
  }
  @override
  Future<Either<Failure, Bill>> sellProduct({required SellProduct sellProduct}) async {
       try {
      return Right(await _saleRemoteDatasource.sellProduct(sellProduct: sellProduct));
    } on CacheException catch (e) {
      return Left(CachedFailure(e.msg));
    } catch (e) {
      return Left(CachedFailure(e.toString()));
    }
  }

}
