import '../../../../core/error/exceptions.dart';
import 'package:injectable/injectable.dart';

abstract class AppRemoteDatasource {
  // Future<User?> getCurrentuserAuth();
  Future<String> getUsers({required String doc});
  // Future<UserCredential> signInWithGoogle();
  // Future<void> setUser(
  //     {required Map<String, dynamic> data, required String doc});
}

@LazySingleton(as: AppRemoteDatasource)
class AppRemoteDatasourceImpl implements AppRemoteDatasource {
  // final AuthService _authService;
  // final CouldFireStoreService _couldFireStoreService;
  // AppRemoteDatasourceImpl(this._authService, this._couldFireStoreService);
  @override
  Future<String> getUsers({required String doc}) async {
    try {
      await Future.delayed(const Duration(seconds: 1));

      return "== Get Users MeMEMEMEME ===";
    } on ServerException catch (e) {
      throw ServerException(e.msg);
    } catch (e) {
      throw CacheException(e.toString());
    }
  }
}
