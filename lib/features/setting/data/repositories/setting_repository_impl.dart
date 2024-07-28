import 'package:gd/core/error/exceptions.dart';
import 'package:gd/core/error/failures.dart';
import 'package:gd/core/models/user.dart';
import 'package:gd/core/params/password_param.dart';
import 'package:gd/core/params/profile_param.dart';
import 'package:gd/features/setting/data/datasources/setting_remote_datasource.dart';
import 'package:gd/features/setting/domain/repositories/setting_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import '../datasources/setting_local_datasource.dart';

@LazySingleton(as: SettingRepository)
class SettingRepositoryImpl implements SettingRepository {
  final SettingRemoteDatasource _settingRemoteDatasource;
  final SettingLocalDatasource _settingLocalDatasource;

  SettingRepositoryImpl(
      this._settingRemoteDatasource,
      this._settingLocalDatasource);

  // @override
  // Future<Either<Failure, void>> signOut() async {
  //   try {
  //     return Right(await _settingRemoteDatasource.signOut());
  //   } on ServerException catch (e) {
  //     return Left(ServerFailure(e.msg));
  //   } on CacheException catch (e) {
  //     return Left(CachedFailure(e.msg));
  //   } catch (e) {
  //     return Left(CachedFailure(e.toString()));
  //   }
  // }
  @override
  Future<Either<Failure, String>> changePassword({required PasswordParams passwordParams}) async {
    try {
      return Right(await _settingRemoteDatasource.changePassword(passwordData: passwordParams));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    } on CacheException catch (e) {
      return Left(CachedFailure(e.msg));
    } catch (e) {
      return Left(CachedFailure(e.toString()));
    }
  }
  @override
  Future<Either<Failure, String>> updateProfile({required ProfileParams profileParams}) async {
    try {
      return Right(await _settingRemoteDatasource.updateProfile(profileData: profileParams));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    } on CacheException catch (e) {
      return Left(CachedFailure(e.msg));
    } catch (e) {
      return Left(CachedFailure(e.toString()));
    }
  }

  @override
  String? getLanguage() {
    try {
      return _settingLocalDatasource.getLanguage();
    } catch (e) {
      return e.toString();
    }
  }

  @override
  Future<Either<Failure, bool>> setLanguage({String? code}) async {
    try {
      return Right(await _settingLocalDatasource.setLanguage(code: code));
    } on CacheException catch (e) {
      return Left(CachedFailure(e.msg));
    } catch (e) {
      return Left(CachedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> getProfile() async {
    try {
      return Right(await _settingLocalDatasource.getProfile());
    } on CacheException catch (e) {
      return Left(CachedFailure(e.msg));
    } catch (e) {
      return Left(CachedFailure(e.toString()));
    }
  }
}
