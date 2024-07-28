import 'package:injectable/injectable.dart';

abstract class HomeRemoteDatasource {
  Future<String> signOut();
  // Future<Users> getCurrentUser();
}

@LazySingleton(as: HomeRemoteDatasource)
class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  HomeRemoteDatasourceImpl();
  @override
  Future<String> signOut() async {
    var getCurrentUser = 'users current user';
    return getCurrentUser;
  }

  // @override
  // Future<Users> getCurrentUser() async {
  //   final authUser = await _authService.getCurrentUser();
  //   final user = await _couldFireStoreService.getDataByDocs(
  //       collection: FireCollection.users, doc: authUser?.uid ?? '');
  //   return Users.fromJson(user ?? {});
  // }
}
