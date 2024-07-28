import 'package:dio/dio.dart';
import 'package:gd/core/constants/app_constants.dart';
import 'package:gd/core/error/exceptions.dart';
import 'package:gd/core/models/user.dart';
import 'package:gd/core/models/login.dart';
import 'package:gd/core/network/network_call.dart';
import 'package:gd/core/services/database_sevice.dart';
import 'package:injectable/injectable.dart';

abstract class LoginRemoteDataSource {
  Future<User> login({required Login loginData});
}

@LazySingleton(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final NetworkCall networkCall;
  final DatabaseService databaseService;

  LoginRemoteDataSourceImpl(this.networkCall, this.databaseService);

  @override
  Future<User> login({required Login loginData}) async {
    try {
      final response = await networkCall.login(loginData.toJson());
      // print(response);
      await databaseService.setData<User>(
          key: DatabaseKey.userKey, data: response, allowClear: true);
      return response;
    } on DioException catch (er) {
      throw ServerException(catchMessageServer(msg: er.response.toString()));
    }
  }
}
