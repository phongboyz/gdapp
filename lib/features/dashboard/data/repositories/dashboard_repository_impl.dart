import 'package:dartz/dartz.dart';
import 'package:gd/core/error/exceptions.dart';
import 'package:gd/core/models/dashboard.dart';
import 'package:gd/features/dashboard/data/datasources/dashboard_remote_datasource.dart';
import 'package:gd/features/dashboard/domain/repository/dashboard_repository.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';

@LazySingleton(as: DashboardRepository)
class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDataSource _dashboardRemoteDatasource;

  DashboardRepositoryImpl(
    this._dashboardRemoteDatasource,
  );

  @override
  Future<Either<Failure, Dashboard>> getDashboard() async {
    try {
      return Right(await _dashboardRemoteDatasource.dashboard());
    } on CacheException catch (e) {
      return Left(CachedFailure(e.msg));
    } catch (e) {
      return Left(CachedFailure(e.toString()));
    }
  }
}
