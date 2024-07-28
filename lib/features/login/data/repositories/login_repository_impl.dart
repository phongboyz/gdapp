import 'package:dartz/dartz.dart';
import 'package:gd/core/error/exceptions.dart';
import 'package:gd/core/models/login.dart';
import 'package:gd/core/models/user.dart';
import 'package:gd/features/login/data/datasources/login_local_datasource.dart';
import 'package:gd/features/login/data/datasources/login_remote_datasource.dart';
import 'package:gd/features/login/domain/repository/login_repository.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';

@LazySingleton(as: LoginRepository)
class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource _loginRemoteDatasource;
  final LoginLocalDataSource _loginLocalDatasource;
  LoginRepositoryImpl(this._loginRemoteDatasource, this._loginLocalDatasource);

  @override
  Future<Either<Failure, User>> login({required Login loginData}) async {
    try {
      final user = await _loginRemoteDatasource.login(loginData: loginData);
      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    } on CacheException catch (e) {
      return Left(CachedFailure(e.msg));
    } catch (e) {
      return Left(CachedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> getProfile() async {
    try {
      return Right(await _loginLocalDatasource.getProfile());
    } on CacheException catch (e) {
      return Left(CachedFailure(e.msg));
    } catch (e) {
      return Left(CachedFailure(e.toString()));
    }
  }
}
