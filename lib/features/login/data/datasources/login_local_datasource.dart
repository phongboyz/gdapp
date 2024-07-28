import 'package:gd/core/constants/app_constants.dart';
import 'package:gd/core/error/exceptions.dart';
import 'package:gd/core/models/user.dart';
import 'package:gd/core/services/database_sevice.dart';
import 'package:injectable/injectable.dart';

abstract class LoginLocalDataSource {
  Future<User> getProfile();
}

@LazySingleton(as: LoginLocalDataSource)
class LoginLocalDatasourceImpl implements LoginLocalDataSource {

  @override
  Future<User> getProfile() async {
    try {
      User? data =
          await DatabaseService().findOne<User>(key: DatabaseKey.userKey);
      return data!;
    } catch (e) {
      throw CacheException(e.toString());
    }
  }
}
