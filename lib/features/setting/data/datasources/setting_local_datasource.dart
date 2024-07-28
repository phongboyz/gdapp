import 'package:gd/core/constants/app_constants.dart';
import 'package:gd/core/constants/shared_pref_key.dart';
import 'package:gd/core/error/exceptions.dart';
import 'package:gd/core/models/user.dart';
import 'package:gd/core/services/database_sevice.dart';
import 'package:gd/core/services/shared_preference_service.dart';
import 'package:injectable/injectable.dart';

abstract class SettingLocalDatasource {
  String? getLanguage();
  Future<bool> setLanguage({String? code});
  Future<User> getProfile();
}

@LazySingleton(as: SettingLocalDatasource)
class SettingLocalDatasourceImpl implements SettingLocalDatasource {
  final SharedPreferenceService _preferenceService;
  SettingLocalDatasourceImpl(this._preferenceService);

  @override
  String? getLanguage() {
    String? code =
        _preferenceService.getData<String>(key: SharedPrefKey.language);
    return code;
  }

  @override
  Future<bool> setLanguage({String? code}) async {
    final data = await _preferenceService.setData<String>(
      key: SharedPrefKey.language,
      data: code ?? 'en',
    );
    return data;
  }

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
