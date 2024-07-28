import 'package:dio/dio.dart';
import 'package:gd/core/constants/app_constants.dart';
import 'package:gd/core/error/exceptions.dart';
import 'package:gd/core/models/dashboard.dart';
import 'package:gd/core/models/user.dart';
import 'package:gd/core/network/network_call.dart';
import 'package:gd/core/services/database_sevice.dart';
import 'package:injectable/injectable.dart';

abstract class DashboardRemoteDataSource {
  Future<Dashboard> dashboard();
}

@LazySingleton(as: DashboardRemoteDataSource)
class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  final NetworkCall networkCall;
  final DatabaseService _databaseService;

  DashboardRemoteDataSourceImpl(this.networkCall, this._databaseService);

  @override
  Future<Dashboard> dashboard() async {
    try {
      final user =
          await _databaseService.findOne<User>(key: DatabaseKey.userKey);
      // print(user?.token);
      Dashboard response = await networkCall.dashboard('Bearer ${user?.token}');
      return response;
    } on DioException catch (er) {
      throw ServerException(er.toString());
    }
  }
}
