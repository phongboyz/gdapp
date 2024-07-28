
import 'package:dartz/dartz.dart';
import 'package:gd/core/error/exceptions.dart';
import 'package:gd/features/app/data/datasources/app_remote_datasource.dart';
import 'package:gd/features/app/domain/repository/app_repository.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';

@LazySingleton(as: AppRepository)
class AppRepositoryImpl implements AppRepository {
  final AppRemoteDatasource _appRemoteDatasource;
  AppRepositoryImpl(this._appRemoteDatasource);
  
  @override
  Future<Either<Failure, String>> getUser({required String doc}) async {
    try {
      final user = await _appRemoteDatasource.getUsers(doc: doc);
      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    } on CacheException catch (e) {
      return Left(CachedFailure(e.msg));
    } catch (e) {
      return Left(CachedFailure(e.toString()));
    }
  }
}
