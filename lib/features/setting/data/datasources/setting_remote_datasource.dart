import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gd/core/constants/app_constants.dart';
import 'package:gd/core/error/exceptions.dart';
import 'package:gd/core/models/user.dart';
import 'package:gd/core/network/network_call.dart';
import 'package:gd/core/params/password_param.dart';
import 'package:gd/core/params/profile_param.dart';
import 'package:gd/core/services/database_sevice.dart';
import 'package:injectable/injectable.dart';

abstract class SettingRemoteDatasource {
  Future<String> changePassword({required PasswordParams passwordData});
  Future<String> updateProfile({required ProfileParams profileData});
}

@LazySingleton(as: SettingRemoteDatasource)
class SettingRemoteDatasourceImpl implements SettingRemoteDatasource {
  final NetworkCall _networkCall;
  final DatabaseService _databaseService;

  SettingRemoteDatasourceImpl(this._networkCall, this._databaseService);

  @override
  Future<String> changePassword({required PasswordParams passwordData}) async {
    try {
      final user =
          await _databaseService.findOne<User>(key: DatabaseKey.userKey);

      var data = await _networkCall.changePassword('Bearer ${user?.token}', {
        "current_password": passwordData.oldPassword,
        "new_password": passwordData.newPassword
      });
      var dataChange = jsonDecode(data);
      return dataChange['message'];
    } on DioException catch (er) {
      throw ServerException(
          catchMessageServer(msg: "${er.response}").toString());
    }
  }

  @override
  Future<String> updateProfile({required ProfileParams profileData}) async {
    try {
      final user =
          await _databaseService.findOne<User>(key: DatabaseKey.userKey);

      var data = await _networkCall.updateProfile('Bearer ${user?.token}', {
        "first_name": profileData.firstname,
        "last_name": profileData.lastname
      });
      var dataChange = jsonDecode(data);
      return dataChange['message'];
    } on DioException catch (er) {
      throw ServerException(
          catchMessageServer(msg: "${er.response}").toString());
    }
  }
}
