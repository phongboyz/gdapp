import 'package:dartz/dartz.dart';
import 'package:gd/core/error/exceptions.dart';
import 'package:gd/core/error/failures.dart';
import 'package:gd/features/home/data/datasources/home_remote_datasource.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/home_repository.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDatasource _remoteDatasource;

  HomeRepositoryImpl(this._remoteDatasource);
  // @override
  Future<Either<Failure, String>> signOut() async {
    try {
      final data = await _remoteDatasource.signOut();
     return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
